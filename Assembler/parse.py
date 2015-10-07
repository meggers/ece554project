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

class DataDirectiveInstruction(Exception):
    def __init__(self, directive_type, label, value):
        self.directive_type = directive_type
        self.label = label
        self.value = value
    def __str__(self):
        return repr(self.directive_type)
    def get(self):
        return self.directive_type, self.label, self.value 

class Line(object):

    structure_directives = ['.text']
    data_directives = ['.ascii', '.byte', '.word', '.space']

    def __init__(self, address, line):

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
            raise DataDirectiveInstruction(raw_fields[1], raw_fields[0], raw_fields[2])

        # check if this is a labelled address and set address
        self.address = address
        if (raw_fields[0][-1] == ':'):
            self.label = raw_fields[0][:-1]
            self.operation = raw_fields[1]
            self.arguments = raw_fields[2].split(',')
        else:
            self.operation = raw_fields[0]
            self.arguments = raw_fields[1].split(',')

    def assemble(self):
        return "poop"