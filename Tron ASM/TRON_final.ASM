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
# @author:   TRONSISTORS
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
	
	groundData:	.space	4096
	p1xCoord:	.byte	12
	p1yCoord:	.byte	32
	p1dir:		.byte	0x64 # used for PPU, not here
	p2xCoord:	.byte	51
	p2yCoord:	.byte	32
	p2dir:		.byte	0x6A # used for PPU, not here
	input:		.word	0
	p1input:	.word	0
	p2input:	.word	0
	
	# We need a 2d array of game positions covering the entire board for background information (where
	# the line was) and collision detection idk how to do this lol
	
	
.text # Code Used for This Program #################################################################

LoadBackSprites:	# Load the sprites from the pattern table into the OAM

	# Fill the whole background with blank sprites
	li $t0,0
	li $t1,1024
	whileLoopToLoadAllBackground:
		sub $zero,$t1,$t0
		blt LoadTopBackground
		# sbt $t0,background0000
		addi $t0,$t0,1
		b whileLoopToLoadAllBackground
	
	# Fill the top of the background with the top sprites
	LoadTopBackground: li $t0,0
		li $t1,32
		
	whileLoopToLoadTopBackground:
		sub $zero,$t1,$t0
		blt LoadLeftBackground
		# sbt $t0,background3300
		addi $t0,$t0,1
		b whileLoopToLoadTopBackground
	
	# Fill the left side of the background with the left sprites
	LoadLeftBackground:
		li $t0,0
		li $t1,1024
		
	whileLoopToLoadLeftBackground:
		sub $zero,$t1,$t0
		blt LoadRightBackground
		# sbt $t0,background3030
		addi $t0,$t0,32
		b whileLoopToLoadLeftBackground
	
	# Fill the right side of the background with the right sprites
	LoadRightBackground:
		li $t0,31
		li $t1,1024
		
	whileLoopToLoadRightBackground:
		sub $zero,$t1,$t0
		blt LoadBottomBackground
		# sbt $t0,background0303
		addi $t0,$t0,32
		b whileLoopToLoadRightBackground
	
	# Fill the bottom of the background with the bottom sprites 
	LoadBottomBackground:
		li $t0,992 # 31 * 32
		li $t1,1024
		
	whileLoopToLoadBottomBackground:
		sub $zero,$t1,$t0
		blt LoadCornerBackground
		# sbt $t0,background0033
		addi $t0,$t0,1
		b whileLoopToLoadBottomBackground
	
	# Load the corners of the background with the corner sprites
	LoadCornerBackground:
		li $t0, 0
		# sbt $t0,background3330
		li $t0, 31
		# sbt $t0,background3303
		li $t0, 992
		# sbt $t0,background3033
		li $t0, 1023
		# sbt $t0,background0333
					
LoadFrontSprites: 	# Load the sprites from the pattern table into the OAM
					# Set the attributes of the sprites for the beginning of the game
	
	 add $t0,$zero,$zero

	
	# Put one copy of light_bike (p1) rotated pi/2 right into OAM
	addi $t0,$t0,1
	# sft $t0,light_bike_rot_0
	addi $t0,$t0,1
	# sft $t0,light_bike_rot_1
	addi $t0,$t0,1
	# sft $t0,light_bike_rot_2
	addi $t0,$t0,1

	# Put one copy of light_bike (p2) rotated pi/2 right into OAM
	 addi $t0,$t0,1
	 # sft $t0,light_bike_rot_0
	 addi $t0,$t0,1
	 # sft $t0,light_bike_rot_1
	 addi $t0,$t0,1
	 # sft $t0,light_bike_rot_2

	
LoadGameData:
	# p1 x coord = 12
	li $s0, 12
	# p1 y coord = 32
	li $s1, 32
	# player 1 direction = 'd'
	li $s2, 0x64
	
	# p2 x coord = 51
	li $s4, 51
	# p2 y coord = 32
	li $s5, 32
	# player 2 direction = 'j'
	li $s6, 0x6A
	
GameLoop:
	# Update p1's position and orientation
		li $t0,0x77
		sub $zero,$t0,$s2
		bne testaUpdate
		addi $s1, $s1, -1
		call p1displayupdate
	testaUpdate:
		li $t0,0x61
		sub $zero,$t0,$s2
		bne testsUpdate
		addi $s0, $s0, -1
		call p1displayupdate
	testsUpdate:
		li $t0,0x73
		sub $zero,$t0,$s2
		bne testdUpdate
		addi $s1, $s1, 1
		call p1displayupdate
	testdUpdate:
		li $t0,0x64
		#bne $t0,$t2,p1displayupdate
		addi $s0, $s0, 1
		call p1displayupdate
	
	# Update p2's position and orientation
		updateP2Postion:
		li $t0,0x69
		sub $zero,$t0,$s6
		bne testjUpdate
		addi $s1, $s1, -1
		call p2displayupdate
	testjUpdate:
		li $t0,0x6A
		sub $zero,$t0,$s6
		bne testkUpdate
		addi $s0, $s0, -1
		call p2displayupdate
	testkUpdate:
		li $t0,0x6B
		sub $zero,$t0,$s6
		bne testlUpdate
		addi $s1, $s1, 1
		call p2displayupdate
	testlUpdate:
		li $t0,0x6C
		sub $zero,$t0,$s6
		bne updateP2Postion
		addi $s0, $s0, 1
		call p2displayupdate
	
	# Update array 
	
	# Check for collision (Branch to end if collision)
gameLoopSpin:
	nop
	b gameLoopSpin



	p1displayupdate:
	# $t0 holds comparison values 
		push $t0
	# t1 holds OAM value of sprite
		push $t1
	# t2 holds sprite position
		push $t2
	# t3 holds the attributes of the sprite 
		push $t3
		
		
	# what do we do if p1 is facing 'w'
		li $t1, 0
	updatespritew:
		li $t0,0x77
		sub $zero,$t0,$s2
		bne updatespritea,
		
	# put the sprite in the OAM
		# sft $t1,light_bike_0
	# set the location of the sprite
		# ssl $t1,$s0,$s1
	# set the attributes (flip) of the sprite
	# TODO determine color palette
		li $t3,0x00
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_1
	# set the location of the sprite
	# direction is up, so next sprite is 8 below
	# the last sprite 
		addi $t2,$s1,8
		# ssl $t1,$s0,$t2
	# set the attributes (flip) of the sprite
	# TODO determine color palette
		li $t3,0x00
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_0
	# set the location of the sprite
	# direction is up, so next sprite is 8 below
	# the last sprite 
		addi $t2,$s1,8
		# ssl $t1,$s0,$t2
	# set the attributes (flip) of the sprite
	# TODO determine color palette
		li $t3,0x00
		sfa $t1,$t3
		b end_p1displayupdate
		
		
	updatespritea:
		li $t0,0x61
		sub $zero,$t0,$s2
		bne updatesprites
		
	# put the sprite in the OAM
		# sft $t1,light_bike_rot_0
	# set the location of the sprite
		# ssl $t1,$s0,$s1
	# set the attributes of the sprite
	# flip both x, y, so MSB is 0xC
	# TODO determine color palette
		li $t3,0xC0
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_rot_1
	# set the location of the sprite
	# direction is left, so next sprite is 8 right of
	# the last sprite 
		addi $t2,$s0,8
		# ssl $t1,$t2,$s1
	# set the attributes of the sprite
	# flip both x, y, so MSB is 0xC
	# TODO determine color palette
		li $t3,0xC0
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_rot_0
	# set the location of the sprite
	# direction is up, so next sprite is 8 right of
	# the last sprite 
		addi $t2,$s0,8
		# ssl $t1,$t2,$s1
	# set the attributes of the sprite
	# flip both x, y, so MSB is 0xC
	# TODO determine color palette
		li $t3,0xC0
		sfa $t1,$t3
		b end_p1displayupdate
		
	updatesprites:
		li $t0,0x73
		sub $zero,$t0,$s2
		bne updatesprited
		
	# put the sprite in the OAM
		# sft $t1,light_bike_0
	# set the location of the sprite
		# ssl $t1,$s0,$s1
	# set the attributes of the sprite
	# flip just y, so MSB is 0x8
	# TODO determine color palette
		li $t3,0x80
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_1
	# set the location of the sprite
	# direction is down, so next sprite is 8 above
	# the last sprite 
		addi $t2,$s1,-8
		# ssl $t1,$s0,$t2
	# set the attributes of the sprite
	# flip just y, so MSB is 0x8
	# TODO determine color palette
		li $t3,0x80
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_0
	# set the location of the sprite
	# direction is down, so next sprite is 8 above
	# the last sprite 
		addi $t2,$s1,-8
		# ssl $t1,$s0,$t2
	# set the attributes of the sprite
	# flip just y, so MSB is 0x8
	# TODO determine color palette
		li $t3,0x80
		sfa $t1,$t3
		b end_p1displayupdate
		
	updatesprited:
		li $t0,0x64
		sub $zero,$t0,$s2
		bne updatesprited
		
	# put the sprite in the OAM
		# sft $t1,light_bike_rot_0
	# set the location of the sprite
		# ssl $t1,$s0,$s1
	# set the attributes of the sprite
	# no flip, so MSB is 0x0
	# TODO determine color palette
		li $t3,0x80
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_rot_1
	# set the location of the sprite
	# direction is right, so next sprite is 8 left of
	# the last sprite 
		addi $t2,$s0,-8
		# ssl $t1,$t1,$s1
	# set the attributes of the sprite
	# no flip, so MSB is 0x0
	# TODO determine color palette
		li $t3,0x80
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_rot_2
	# set the location of the sprite
	# direction is right, so next sprite is 8 left of
	# the last sprite 
		addi $t2,$s0,-8
		# ssl $t1,$t1,$s1
	# set the attributes of the sprite
	# no flip, so MSB is 0x0
	# TODO determine color palette
		li $t3,0x80
		sfa $t1,$t3
		
		
	end_p1displayupdate:
		pop $t3
		pop $t2
		pop $t1
		pop $t0
		return
		
		
		
	p2displayupdate:
	# $t0 holds comparison values 
		push $t0
	# t1 holds OAM value of sprite
		push $t1
	# t2 holds sprite position
		push $t2
	# t3 holds the attributes of the sprite 
		push $t3
		
		
	# what do we do if p2 is facing 'i'
		li $t1, 3
	updatespritei:
		li $t0,0x69
		sub $zero,$t0,$s6
		bne updatespritea
		
	# put the sprite in the OAM
		# sft $t1,light_bike_0
	# set the location of the sprite
		# ssl $t1,$s0,$s1
	# set the attributes (flip) of the sprite
	# TODO determine color palette
		li $t3,0x0F
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_1
	# set the location of the sprite
	# direction is up, so next sprite is 8 below
	# the last sprite 
		addi $t2,$s1,8
		# ssl $t1,$s0,$t2
	# set the attributes (flip) of the sprite
	# TODO determine color palette
		li $t3,0x0F
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_0
	# set the location of the sprite
	# direction is up, so next sprite is 8 below
	# the last sprite 
		addi $t2,$s1,8
		# ssl $t1,$s0,$t2
	# set the attributes (flip) of the sprite
	# TODO determine color palette
		li $t3,0x0F
		sfa $t1,$t3
		b end_p2displayupdate
		
		
	updatespritej:
		li $t0,0x6A
		sub $zero,$t0,$s6
		bne updatesprites
		
	# put the sprite in the OAM
		# sft $t1,light_bike_rot_0
	# set the location of the sprite
		# ssl $t1,$s0,$s1
	# set the attributes of the sprite
	# flip both x, y, so MSB is 0xC
	# TODO determine color palette
		li $t3,0xCF
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_rot_1
	# set the location of the sprite
	# direction is left, so next sprite is 8 right of
	# the last sprite 
		addi $t2,$s0,8
		# ssl $t1,$t2,$s1
	# set the attributes of the sprite
	# flip both x, y, so MSB is 0xC
	# TODO determine color palette
		li $t3,0xCF
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_rot_0
	# set the location of the sprite
	# direction is up, so next sprite is 8 right of
	# the last sprite 
		addi $t2,$s0,8
		# ssl $t1,$t2,$s1
	# set the attributes of the sprite
	# flip both x, y, so MSB is 0xC
	# TODO determine color palette
		li $t3,0xCF
		sfa $t1,$t3
		b end_p2displayupdate
		
	updatespritek:
		li $t0,0x6B
		sub $zero,$t0,$s6
		bne updatesprited
		
	# put the sprite in the OAM
		# sft $t1,light_bike_0
	# set the location of the sprite
		# ssl $t1,$s0,$s1
	# set the attributes of the sprite
	# flip just y, so MSB is 0x8
	# TODO determine color palette
		li $t3,0x8F
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_1
	# set the location of the sprite
	# direction is down, so next sprite is 8 above
	# the last sprite 
		addi $t2,$s1,-8
		# ssl $t1,$s0,$t2
	# set the attributes of the sprite
	# flip just y, so MSB is 0x8
	# TODO determine color palette
		li $t3,0x8F
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_0
	# set the location of the sprite
	# direction is down, so next sprite is 8 above
	# the last sprite 
		addi $t2,$s1,-8
		# ssl $t1,$s0,$t2
	# set the attributes of the sprite
	# flip just y, so MSB is 0x8
	# TODO determine color palette
		li $t3,0x8F
		sfa $t1,$t3
		b end_p2displayupdate
		
	updatespritel:
		li $t0,0x6C
		sub $zero,$t0,$s6
		bne updatesprited
		
	# put the sprite in the OAM
		# sft $t1,light_bike_rot_0
	# set the location of the sprite
		# ssl $t1,$s0,$s1
	# set the attributes of the sprite
	# no flip, so MSB is 0x0
	# TODO determine color palette
		li $t3,0x8F
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_rot_1
	# set the location of the sprite
	# direction is right, so next sprite is 8 left of
	# the last sprite 
		addi $t2,$s0,-8
		# ssl $t1,$t1,$s1
	# set the attributes of the sprite
	# no flip, so MSB is 0x0
	# TODO determine color palette
		li $t3,0x8F
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_rot_2
	# set the location of the sprite
	# direction is right, so next sprite is 8 left of
	# the last sprite 
		addi $t2,$s0,-8
		# ssl $t1,$t1,$s1
	# set the attributes of the sprite
	# no flip, so MSB is 0x0
	# TODO determine color palette
		li $t3,0x8F
		sfa $t1,$t3
		
		
	end_p2displayupdate:
		pop $t3
		pop $t2
		pop $t1
		pop $t0
		return


	
kb_handler:
		
		# Put the input from the SPART into $t2 for comparison tests
		add $t2,$28,$zero
		
		# Was the input a "w"?
		li $t0,0x77
		sub $zero,$t0,$t2
		bne testa
		# It was! but was p1 moving down/'s'? if so, ignore.
		li $t0,0x73
		sub $zero,$t0,$s2
		beq endKBHandler
		# player 1 is moving up
		li $s2,0x77
		b endKBHandler
		
	testa:
		# Was the input an "a"?
		li $t0,0x61
		sub $zero,$t0,$t2
		bne tests
		# It was! but was p1 moving right? if so, ignore.
		li $t0,0x64
		sub $zero,$t0,$s2
		beq endKBHandler
		# player 1 is moving left
		li $s2,0x61
		b endKBHandler
		
	tests:
		# Was the input an "s"?
		li $t0,0x73
		sub $zero,$t0,$t2
		bne testd
		# It was! but was p1 moving up? if so, ignore.
		li $t0,0x77
		sub $zero,$t0,$s2
		beq endKBHandler
		# player 1 is moving down
		li $s2,0x73
		b endKBHandler

	testd:
		# Was the input a "d"?
		li $t0,0x64
		sub $zero,$t0,$t2
		bne testi
		# It was! but was p1 moving left? if so, ignore.
		li $t0,0x61
		sub $zero,$t0,$s2
		beq endKBHandler
		# player 1 is moving right
		li $s2,0x64
		b endKBHandler

	testi:
		# Was the input an "i"?
		li $t0,0x69
		sub $zero,$t0,$t2
		bne testj
		# It was! but was p2 moving down? if so, ignore.
		li $t0,0x6B
		sub $zero,$t0,$s2
		beq endKBHandler
		# player 2 is moving up
		li $s6,0x69
		b endKBHandler


	testj:
		# Was the input a "j"?
		li $t0,0x6A
		sub $zero,$t0,$t2
		bne testk
		# It was! but was p2 moving right? if so, ignore.
		li $t0,0x6C
		sub $zero,$t0,$s2
		beq endKBHandler
		# player 2 is moving left
		li $s6,0x6A
		b endKBHandler

	testk:
		# Was the input a "k"?
		li $t0,0x6B
		sub $zero,$t0,$t2
		bne testl
		# It was! but was p2 moving up? if so, ignore.
		li $t0,0x69
		sub $zero,$t0,$s2
		beq endKBHandler
		# player 2 is moving down
		li $s6,0x6B
		b endKBHandler

	testl:
		# Was the input an "l"?
		li $t0,0x6C
		sub $zero,$t0,$t2
		bne endKBHandler
		# It was! but was p2 moving left? if so, ignore.
		li $t0,0x6A
		sub $zero,$t0,$s2
		beq endKBHandler
		# player 2 is moving right
		li $s6,0x6C
		b endKBHandler


endKBHandler:
	nop
	# TODO: Find out how to branch to the address in $epc
	b gameLoopSpin
	
	
game_tick_interrupt:	
	nop
	b GameLoop

keyboard_interrupt:
	nop
	b kb_handler

stack_ov_interrupt:
