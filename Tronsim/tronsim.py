#!/usr/bin/python
# Usage: python tronsim.py program memory


import sys

# CPU Context
PC_START = 0
GP_START = 0
class CPU_Context:
	def __init__(self):
		# Register array of longs (32 bits)
		self.regs = array('l', [0] * 32)
		regs[29] = PC_START
		regs[30] = GP_START



# PPU Context
class PPU_context:
	def __init__(self):
		# OAM array of unsigned bytes (8 bits)
		self.OAM = array('B', [0] * 256)



def main(argv) :
	# Open the program file and place it into an array
	# program = open()

	# Create or open a file that contains CPU memory

	# Initialize CPU memory

	# Open the files for the following:
	# BG Tile Table
	# BG Attribute Table
	# Pattern Table
	# Sprite Color Palettes
	# BG Color Palettes


	# Initialize CPU and PPU contexts

	# Infinite Loop
		# Interpret PC from cpu_context as index and read from program array

		# Parse opcode from instruction (through CSV file)

		# Update memory
		# Update CPU_Context (including PC = PC + 4 if necessary)
		# Update PPU_Context





if __name__ == "__main__" : main (argv)