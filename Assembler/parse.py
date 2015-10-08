#!/usr/bin/python

class EmptyLine(Exception):
    def __init__(self, value):
        self.value = value
    def __str__(self):
        return repr(self.value)   

class StartInstructions(Exception):
    def __init__(self, value):
        self.value = value
    def __str__(self):
        return repr(self.value)
    def get(self):
        return self.value

class DataDirective(Exception):
    def __init__(self, directive_type, label, value):
        self.directive_type = directive_type
        self.label = label
        self.value = value
    def __str__(self):
        return repr(self.directive_type)
    def get(self):
        return self.directive_type, self.label, self.value 

def singleton(cls):
    instances = {}
    def getinstance():
        if cls not in instances:
            instances[cls] = cls()
        return instances[cls]
    return getinstance

@singleton
class DataWarehouse(object):

    reg_file = "../common/reg-definitions.csv"
    isa_file = "../common/isa-definitions.csv"

    data_address = int('0x000', 16)
    instructions_address = int('0x800', 16)

    lookup_table = {}
    instruction_set = {}

    def __init__(self):
        with open(self.reg_file) as f:
            lines = f.readlines()
            for line in lines[1:]:
                register_parts = line.rstrip().split(',')
                self.lookup_table[register_parts[0]] = register_parts[1]

        with open(self.isa_file) as f:
            lines = f.readlines()
            for line in lines[1:]:
                instruction_parts = line.rstrip().split(',')
                self.instruction_set[instruction_parts[0]] = instruction_parts[1]

class Line(object):

    structure_directives = ['.text']
    data_directives = ['.asciiz', '.byte', '.word', '.space']

    data = DataWarehouse()

    # if empty initialize line to noop
    def __init__(self, address, line = "add $zero,$zero,$zero"):

        # remove comments
        clean_line = line.split("#")[0]

        # split on spaces
        raw_fields = clean_line.split()

        # check if this field contains information
        if (len(raw_fields) == 0):
            raise EmptyLine('No information on this line, ignore it.')

        # check if this is a structural directive
        if (raw_fields[0] in self.structure_directives):
            raise StartInstructions(raw_fields)

        # check if this is a data directive
        if (raw_fields[1] in self.data_directives):
            raise DataDirective(raw_fields[1], raw_fields[0], raw_fields[2])

        # check if this is a labelled address and set address
        self.address = address
        if (raw_fields[0][-1] == ':'):
            self.label = raw_fields[0][:-1]
            self.operation = raw_fields[1]
            try:
                self.arguments = raw_fields[2].split(',')
            except IndexError:
                self.arguments = None
        else:
            self.operation = raw_fields[0]
            self.arguments = raw_fields[1].split(',')

    def assemble(self):
        binary_instruction = self.data.instruction_set[self.operation]
        return format(int(binary_instruction, 2), '08x')