#!/usr/bin/python
# 
#   Tronsistor-32 ISA
#   Assembler
#

import sys, getopt
from parse import *

lookup_table = {
    "$zero":0,
    "$at":  1,
    "$v0":  2,
    "$v1":  3,
    "$a0":  4,
    "$a1":  5,
    "$a2":  6,
    "$a3":  7,
    "$t0":  8,
    "$t1":  9,
    "$t2":  10,
    "$t3":  11,
    "$t4":  12,
    "$t5":  13,
    "$t6":  14,
    "$t7":  15,
    "$s0":  16,
    "$s1":  17,
    "$s2":  18,
    "$s3":  19,
    "$s4":  20,
    "$s5":  21,
    "$s6":  22,
    "$s7":  23,
    "$t8":  24,
    "$t9":  25,
    "$t10": 26,
    "$au":  27,
    "$gp":  28,
    "$sp":  29,
    "$fp":  30,
    "$ra":  31
}

# return numeric value of symbol or number
def getVal (s) :
    global lookup_table
    if not s: return 0            # Empty symbol - zero
    a = lookup_table.get(s)       # Get value or None if not in lookup
    if a == None : return int(s)  # Just a number
    else         : return a

def pass1(program):
    current_address = int('0x000', 16)
    for line in program:
        try:
            print line
            instruction = Line(current_address, line)
            current_address += 1
        except EmptyLine:
            current_address -= 1
        except StartInstructions:
            current_address = int('0x800', 16)

def pass2(program):
    print "pass2"

def main((input_filename, output_filename)):
    with open(input_filename) as f:
        program = f.readlines()
        pass1(program)
        pass2(program)

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