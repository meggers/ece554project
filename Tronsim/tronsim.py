#!/usr/bin/python
# Usage: python tronsim.py program memory


import sys

# CPU Context
PC_START = 0
GP_START = 0
class CPU_Context:

	def init_cpu_mem(self):
		# Initialize 1k of CPU memory (change?!?!)
		self.cpu_mem = ['' for i in range(0, 1048576)]
		
	def init_regs(self):
		# Register array of longs (32 bits)
		self.regs = array('l', [0] * 32)
		regs[29] = PC_START
		regs[30] = GP_START
		
	def init_prog(self, pfile):
		# Puts the whole program into an array lol
		program = open(pfile, r)
		prog_array = program.readlines()
		# Convert the program in hex to binary
		# probably need some error checking here
		for i in range(0, len(prog_array))
			bin(int(prog_array[i], 16))[2:].zfill(32)
		
	def __init__(self, pfile):
		self.init_cpu_mem(self)
		self.init_regs(self)
		self.init_prog(self, pfile)



# PPU Context
class PPU_context:

	def init_oam(self):
		# OAM array of unsigned bytes (8 bits)
		self.OAM = array('B', [0] * 256)
	def __init__(self):
		init_oam(self)
		



def main(argv) :
	

	# Open the files for the following:
	# BG Tile Table
	# BG Attribute Table
	# Pattern Table
	# Sprite Color Palettes
	# BG Color Palettes


	# Initialize CPU and PPU contexts
	CPU = CPU_Context()
	PPU = PPU_Context()
	# Infinite Loop
		# Interpret PC from cpu_context as index and read from program array

		# Parse opcode from instruction (through CSV file)

		# Update memory
		# Update CPU_Context (including PC = PC + 4 if necessary)
		# Update PPU_Context





if __name__ == "__main__" : main (argv)