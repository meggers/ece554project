### Program Header #################################################################################
# ECE 267 Project 1 Final.asm
# 
# This .asm file runs the game of Bulls and Cows. One of the user will set a secret code of 4 unit 
# digits while the other user tries to guess the secret code. After every guess, the guesser will be
# given a hint of how many bulls and cow was guessed correctly. A bull is the correct digit in the 
# correct position while a cow is the correct digit in the wrong position. The guesser may use 
# repeated digit but bulls xor cows will only be counted once for each unique digit. 
#
# Features:
# Guesses were mirror for the guesser to check what was inputted
# Singular and plural forms of cow(s), bull(s) and round(s) were accounted
# The guesser may enter 'q' to quit
# Error tolerance for repeated digits for secret code input
# Error tolerance for non-number secret code
# Error tolerance for non 4 digit entry
# Error tolerance for non-number guesses except 'q'
# The program will show the correct secret code at the end
# Round number is not increased if the guess is invalid
# 
# Class: ECE 267, 2012 Spring
# Professor: Wenjing Rao
# TA: Umer Cheema
# System: MARS 4.5, Windows 7 Professional, 64-bit
# 
# @author: Kai Zhao
# @version: 2012 February 26
# 26 * 4 = 104 pixels across
# 20 * 4 = 80 pixels down
# player 1 starts at 19th (18) pixel across, 39th (38) pixels down
# player 2 starts at 86th (85) pixel across, 39th (38) pixels down
# up, down, left, right = 0, 1, 2, 3
.data # Data Used for This Program #################################################################	
	# Register Directory #######################################################################
	# $t0 = 'X'
	# $t1 = 'O'
	# $t2 = input
	# $t3 = previous input
	# $t4 = timer interrupt
	# $t5 = 
	# $t6 = 
	# $t7 = 
	# $t8 = 
	# $t9 = 
	# $s0 = p1xCoord
	# $s1 = p1yCoord
	# $s2 = p1dir
	# $s3 = p1location
	# $s4 = p2xCoord
	# $s5 = p2yCoord
	# $s6 = p2dir
	# $s7 = p2location
	
	#background:	.asciiz "\n##########################################################################################################\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n##########################################################################################################"
	background:	.asciiz "##########################################################################################################\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n#                                                                                                        #\n##########################################################################################################"
	endRound1:	.asciiz "Winner: Player "
	p1xCoord:	.byte	19
	p1yCoord:	.byte	38
	p1dir:		.byte	3
	p2xCoord:	.byte	85
	p2yCoord:	.byte	38
	p2dir:		.byte	2
	input:		.word	0
	p1input:	.word	0
	p2input:	.word	0

.text # Code Used for This Program #################################################################
inputCode: # Grab User Input and Check Validity ####################################################
	li $t0, 0x00000058			# load data
	li $t1, 0x0000004F
	lb $s0, p1xCoord
	lb $s1, p1yCoord
	lb $s2, p1dir
	#li $s3, 4192
	lb $s4, p2xCoord
	lb $s5, p2yCoord
	lb $s6, p2dir
	#li $s7, 4259	# 4192 + 67
	li $s3, 2052
	li $s7, 2119
	updateDisplay:
		sb $t0, background($s3)
		sb $t1, background($s7)
		la $a0, background		# load background
		li $v0, 4			# print string
		syscall				# display prompt for user input
		getInput:
			li $v0, 12
			syscall				# grab string for secret code
			beq $v0, $s2, getInput
			beq $v0, $s6, getInput
		beq $v0, 0x00000077, p1ChangeDirection
		beq $v0, 0x00000073, p1ChangeDirection
		beq $v0, 0x00000061, p1ChangeDirection
		beq $v0, 0x00000064, p1ChangeDirection
		beq $v0, 0x00000069, p2ChangeDirection
		beq $v0, 0x0000006b, p2ChangeDirection
		beq $v0, 0x0000006a, p2ChangeDirection
		beq $v0, 0x0000006c, p2ChangeDirection
		j updateDisplay
	li $v0, 10
	syscall					# terminate program
	
p1ChangeDirection:
	move $s2, $v0
	beq $v0, 0x00000077, p1GoUp
	beq $v0, 0x00000073, p1GoDown
	beq $v0, 0x00000061, p1GoLeft
	beq $v0, 0x00000064, p1GoRight
	j updateDisplay
	
p2ChangeDirection:
	move $s6, $v0
	beq $v0, 0x00000069, p2GoUp
	beq $v0, 0x0000006b, p2GoDown
	beq $v0, 0x0000006a, p2GoLeft
	beq $v0, 0x0000006c, p2GoRight
	j updateDisplay
	
p1GoUp:
	add $s3, $s3, -107
	j updateDisplay
p1GoDown:
	add $s3, $s3, 107
	j updateDisplay
p1GoLeft:
	add $s3, $s3, -1
	j updateDisplay
p1GoRight:
	add $s3, $s3, 1
	j updateDisplay
p2GoUp:
	add $s7, $s7, -107
	j updateDisplay
p2GoDown:
	add $s7, $s7, 107
	j updateDisplay
p2GoLeft:
	add $s7, $s7, -1
	j updateDisplay
p2GoRight:
	add $s7, $s7, 1
	j updateDisplay
	
