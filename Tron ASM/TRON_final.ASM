### Program Header #################################################################################
# tron.asm
# 
# This .asm file runs the game of Tron. Player 1 uses "wasd" for directional movements while player
# 2 uses "ijkl" for directional movements. 
# 
# Class:     ECE 554, 2015 Fall
# Professor: Azadeh Davoodi
# TA:        Anil
# System:    TRONSISTORS-32
# 
# @author:   Kai Zhao
# @version:  2015 Octoment
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
	# $t3 = start timer
	# $t4 = timer - start timer
	# $t5 = counter
	# $t6 = division, $t4/1000
	# $t7 = player1, what was there before to detect lose
	# $t8 = player2, what was there before to detect lose
	# $t9 = total of player 1 and player 2
	# $s0 = p1xCoord
	# $s1 = p1yCoord
	# $s2 = p1dir
	# $s3 = p1location
	# $s4 = p2xCoord
	# $s5 = p2yCoord
	# $s6 = p2dir
	# $s7 = p2location
	

	p1xCoord:	.byte	19
	p1yCoord:	.byte	38
	p1dir:		.byte	0 # used for PPU, not here
	p2xCoord:	.byte	85
	p2yCoord:	.byte	38
	p2dir:		.byte	0 # used for PPU, not here
	input:		.word	0
	p1input:	.word	0
	p2input:	.word	0
	
	# We need a 2d array of game positions covering the entire board for background information (where
	# the line was) and collision detection idk how to do this lol
	
	
.text # Code Used for This Program #################################################################


LoadFrontSprites: 	# Load the sprites from the pattern table into the OAM

					# Set the attributes of the sprites for the beginning of the game

LoadBackSprites:	# Load the sprites from the pattern table into the OAM
				
					# Set the attributes of the bg sprites
					
					


GameLoop:
			# Update p1's position
			
			# Update p1's orientation
			
			# Update p2's position
			
			# Update p2's orientation
			
			
			# Update array 
			
			# Check for collision (Branch to end if collision)
			
			






GameTickInterruptHandler:
	# Can't branch directly to a branch
	nop
	b GameLoop


KeyboardInterruptHandler: 
		
		# Put the input from the SPART into $t2 for comparison tests
		lw $t2,input
		
		# Was the input a "w"?
		li $t0,0x77
		bne testa,$t0,$t2
		# It was! but was p1 moving down? if so, ignore.
		li $t0,2
		beq endKBHandler,$t0,$s2
		# player 1 is moving up
		li $s2,0
		b endKBHandler
		
	testa:
		# Was the input an "a"?
		li $t0,0x61
		bne tests,$t0,$t2
		# It was! but was p1 moving right? if so, ignore.
		li $t0,3
		beq endKBHandler,$t0,$s2
		# player 1 is moving left
		li $s2,1
		b endKBHandler
		
	tests:
		# Was the input an "s"?
		li $t0,0x73
		bne testd,$t0,$t2
		# It was! but was p1 moving up? if so, ignore.
		li $t0,0
		beq endKBHandler,$t0,$s2
		# player 1 is moving down
		li $s2,2
		b endKBHandler

	testd:
		# Was the input a "d"?
		li $t0,0x64
		bne testi,$t0,$t2
		# It was! but was p1 moving left? if so, ignore.
		li $t0,1
		beq endKBHandler,$t0,$s2
		# player 1 is moving right
		li $s2,3
		b endKBHandler

	testi:
		# Was the input an "i"?
		li $t0,0x69
		bne testj,$t0,$t2
		# It was! but was p2 moving down? if so, ignore.
		li $t0,2
		beq endKBHandler,$t0,$s2
		# player 2 is moving up
		li $s6,0
		b endKBHandler


	testj:
		# Was the input a "j"?
		li $t0,0x6A
		bne testk,$t0,$t2
		# It was! but was p2 moving right? if so, ignore.
		li $t0,3
		beq endKBHandler,$t0,$s2
		# player 2 is moving left
		li $s6,1
		b endKBHandler

	testk:
		# Was the input a "k"?
		li $t0,0x6B
		bne testl,$t0,$t2
		# It was! but was p2 moving up? if so, ignore.
		li $t0,0
		beq endKBHandler,$t0,$s2
		# player 2 is moving down
		li $s6,2
		b endKBHandler

	testl:
		# Was the input an "l"?
		li $t0,0x6C
		bne endKBHandler,$t0,$t2
		# It was! but was p2 moving left? if so, ignore.
		li $t0,1
		beq endKBHandler,$t0,$s2
		# player 2 is moving right
		li $s6,3
		b endKBHandler

	
	
	
	
endKBHandler:
	sw $zero,input
	b $ra

	
	
StackOverflowHandler:
