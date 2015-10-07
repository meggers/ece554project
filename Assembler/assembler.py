#!/usr/bin/python
# 
#   Tronsistor-32 ISA
#   Assembler
#

import sys, getopt
from parse import *

lookup_table = {}

# return numeric value of symbol or number
def getVal (s) :
    global lookup_table
    if not s: return 0            # Empty symbol - zero
    a = lookup_table.get(s)       # Get value or None if not in lookup
    if a == None : return int(s)  # Just a number
    else         : return a

def read(program):
    global lookup_table

    instructions = []
    current_address = int('0x000', 16)

    for line in program:
        try:
            instruction = Line(current_address, line)
            instructions.append(instruction)
            if (instruction.label != None):
                lookup_table[instruction.label] = current_address

            current_address += 1
        except EmptyLine:
            continue
        except StartInstructions:
            current_address = int('0x800', 16)

    return instructions

def assemble(instructions):
    return []

def dump(assembly, output_filename):
    print output_filename

def main((input_filename, output_filename)):
    global lookup_table

    with open(input_filename) as f:
        program = f.readlines()
        instructions = read(program)
        assembly = assemble(instructions)
        dump(assembly, output_filename)

# print standard usage msg & any addtl msgs, then exit
def usage(exit_code, *args):
    for arg in args:
        print arg

    print "assembler.py -i <input_filename> -o <output_filename>"
    sys.exit(exit_code)

# parse our command line arguments
def parse_args(argv):
    input_filename = ""
    output_filename = ""

    try:
        opts, args = getopt.getopt(argv, "hi:o:", ["help","input=","output="])
    except getopt.GetoptError as error:
        usage(2, str(error))

    for opt, arg in opts:
        if opt in ("-h", "--help"):
            usage(0)
        elif opt in ("-i", "--input"):
            input_filename = arg
        elif opt in ("-o", "--output"):
            output_filename = arg

    if input_filename in [None, ""]:
        usage(2, 'You must specify an input filename.')
    elif output_filename in [None, ""]:
        usage(2, 'You must specify an output filename.')

    return input_filename, output_filename    

if __name__ == "__main__": 
    main(parse_args(sys.argv[1:]))