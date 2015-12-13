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
	# $s3 = WHICH ONE LOST
	# $s4 = p2xCoord
	# $s5 = p2yCoord
	# $s6 = p2dir
	# $s7 = p2location
	
	groundData:	.space	32
	p1xCoord:	.word	64
	p1yCoord:	.word	128
	p1dir:		.byte	0x64 # used for PPU, not here
	p2xCoord:	.word	5
	p2yCoord:	.word	128
	p2dir:		.byte	0x6A # used for PPU, not here
	input:		.word	0
	p1input:	.word	0
	p2input:	.word	0
	
	x_mask:             .word 0xFF000000
	sprite_index_mask:  .word 0x00FF0000
	vertical_flip_mask: .word 0x00008000
	horiz_flip_mask:    .word 0x00004000
	color_palette_mask: .word 0x00000300
	y_mask:             .word 0x000000FF

	oam_copy: .space 64

	
	
.text # Code Used for This Program #################################################################


LoadBackSprites:	# Load the sprites from the pattern table into the OAM

	# Fill the whole background with blank sprites
	li $t0,0
	li $t1,1024
	li $t2,background0000_index
	whileLoopToLoadAllBackground:
		sub $zero,$t1,$t0
		blt LoadTopBackground
		sbt $t0,$t2
		addi $t0,$t0,1
		b whileLoopToLoadAllBackground
	
	# Fill the top of the background with the top sprites 
	LoadTopBackground: li $t0,0
		li $t1,31
		li $t2,background3300_index
	whileLoopToLoadTopBackground:
		sub $zero,$t1,$t0
		blt LoadLeftBackground
		sbt $t0,$t2
		addi $t0,$t0,1
		b whileLoopToLoadTopBackground
	
	# Fill the left side of the background with the left sprites
	LoadLeftBackground:
		li $t0,0
		li $t1,1024
		li $t2,background3030_index
	whileLoopToLoadLeftBackground:
		sub $zero,$t1,$t0
		blt LoadRightBackground
		sbt $t0,$t2
		addi $t0,$t0,32
		b whileLoopToLoadLeftBackground
	
	# Fill the right side of the background with the right sprites
	LoadRightBackground:
		li $t0,31
		li $t1,1024
		li $t2,background0303_index
	whileLoopToLoadRightBackground:
		sub $zero,$t1,$t0
		blt LoadBottomBackground
		sbt $t0,$t2
		addi $t0,$t0,32
		b whileLoopToLoadRightBackground
	
	# Fill the bottom of the background with the bottom sprites 
	LoadBottomBackground:
		li $t0,992 # 31 * 32
		li $t1,1024
		li $t2,background0033_index
	whileLoopToLoadBottomBackground:
		sub $zero,$t1,$t0
		blt LoadCornerBackground
		sbt $t0,$t2
		addi $t0,$t0,1
		b whileLoopToLoadBottomBackground
	
	# Load the corners of the background with the corner sprites
	LoadCornerBackground:
		li $t0, 0
		li $t2,background3330_index
		sbt $t0,$t2
		# sbt $t0,background3330
		li $t0, 31
		li $t2,background3303_index
		sbt $t0,$t2
		# sbt $t0,background3303
		li $t0, 992
		li $t2,background3033_index
		sbt $t0,$t2
		# sbt $t0,background3033
		li $t0, 1023
		li $t2,background0333_index
		sbt $t0,$t2
		# sbt $t0,background0333
	#commented out, kai was testing this on dec 8th
	#li $t0,0
	#li $t1,light_bike_small_rotated_index
	#sft $t0,$t1
	#li $t1,0
	#sfa $t0,$t1



LoadGameData:
	# p1 x coord = 64
	lw $s0,$0,p1xCoord
	# p1 y coord = 128
	lw $s1,$0,p1yCoord
	# player 1 direction = 'd'
	li $s2, 0x64
	
	# p2 x coord = 192
	#lw $s4,$0,p2xCoord
	li $s4,192
	# p2 y coord = 128
	lw $s5,$0,p2yCoord
	# player 2 direction = 'j'
	li $s6, 0x6A
	
	
# Store the background and the starting position in the collision detection array
	li $t0,0
	li $t1,30
	li $t2,0xFFFFFFFF
	sw $t2,$t0,groundData
	li $t2,1
	sll $t2,$t2,31
	addi $t2,$t2,1
	addi $t0,$t0,1
	
	loadSidesGround:nop
		sub $zero,$t1,$t0
		blt endLoadSidesGround
		sw $t2,$t0,groundData
		addi $t0,$t0,1
		b loadSidesGround
	endLoadSidesGround:
		li $t2,0xFFFFFFFF
		sw $t2,$t0,groundData

					
LoadFrontSprites: 

	
	# Put one copy of light_bike (p1) rotated pi/2 right into OAM
	add $t0,$zero,$zero
	li $t1,light_bike_small_rotated_index
	sft $t0,$t1
	
	# Set the proper location
	# addi ... 8 because the middle is "where the bike is"
	addi $t2,$s0,8
	sll $t2,$t2,8
	add $t2,$t2,$s1
	ssl $t0,$t2

	# Set attributes
	addi $t3,$zero,0x41
	sfa $t0,$t3
	
	# Add 2nd sprite of p1 to OAM
	addi $t0,$t0,1
	addi $t1,$t1,1
	sft $t0,$t1
	# Set location
	addi $t2,$t2,-0x800
	ssl $t0,$t2
	# Set attributes
	sfa $t0,$t3
	
	# Add 3rd sprite of p1 to OAM
	addi $t0,$t0,1
	addi $t1,$t1,1
	sft $t0,$t1
	# Set location
	addi $t2,$t2,-0x800
	ssl $t0,$t2
	# Set attributes
	sfa $t0,$t3

	# Put one copy of light_bike (p2) rotated pi/2 right into OAM
	addi $t0,$t0,1
	li $t1,light_bike_small_rotated_index
	sft $t0,$t1
	
	# Set the proper Location
	addi $t2,$s4,-8
	sll $t2,$t2,8
	add $t2,$t2,$s5
	ssl $t0,$t2
	# Set attributes
	addi $t3,$zero,0x02
	sfa $t0,$t3
	
	# Add 2nd sprite of p2 into OAM
	addi $t0,$t0,1
	addi $t1,$t1,1
	sft $t0,$t1
	# Set location
	addi $t2,$t2,0x800
	ssl $t0,$t2
	# Set attributes
	sfa $t0,$t3
	
	# Add 2nd sprite of p2 into OAM
	addi $t0,$t0,1
	addi $t1,$t1,1
	sft $t0,$t1
	# Set location
	addi $t2,$t2,0x800
	ssl $t0,$t2
	# Set attributes
	sfa $t0,$t3	

GameLoop:
	# Update p1's position and orientation
		li $t0,0x77
		sub $zero,$t0,$s2
		bne testaUpdate
		addi $s1,$s1,-1
		addi $a2,$zero,0
		b endP1DisplayUpdate
	testaUpdate:
		li $t0,0x61
		sub $zero,$t0,$s2
		bne testsUpdate
		addi $s0,$s0,-1
		addi $a2,$zero,1
		b endP1DisplayUpdate
	testsUpdate:
		li $t0,0x73
		sub $zero,$t0,$s2
		bne testdUpdate
		addi $s1,$s1,1
		addi $a2,$zero,2
		b endP1DisplayUpdate
	testdUpdate:
		li $t0,0x64
		sub $zero,$t0,$s2
		bne updateP2Postion
		addi $s0,$s0,1
		addi $a2,$zero,3
		b endP1DisplayUpdate
		
		
		
	endP1DisplayUpdate:
		add $a0,$s0,$zero
		add $a1,$s1,$zero
		call updateGround
		nop
		sll $s3,$s3,1
		call p1displayupdate

	
	# Update p2's position and orientation and update the ground
		updateP2Postion:
		li $t0,0x69
		sub $zero,$t0,$s6
		bne testjUpdate
		addi $s5,$s5,-1
		addi $a2,$zero,0
		b endP2DisplayUpdate
	testjUpdate:
		li $t0,0x6A
		sub $zero,$t0,$s6
		bne testkUpdate
		addi $s4,$s4,-1
		addi $a2,$zero,1
		b endP2DisplayUpdate
	testkUpdate:
		li $t0,0x6B
		sub $zero,$t0,$s6
		bne testlUpdate
		addi $s5,$s5,1
		addi $a2,$zero,2
		b endP2DisplayUpdate
	testlUpdate:
		li $t0,0x6C
		sub $zero,$t0,$s6
		bne gameLoopSpin
		addi $s4, $s4, 1
		addi $a2,$zero,3
		b endP2DisplayUpdate
		
	endP2DisplayUpdate:
		add $a0,$s4,$zero
		add $a1,$s5,$zero
		call updateGround
		nop
		call p2displayupdate

		
	
	
		add $zero,$s3,$zero
		bne GameFail
gameLoopSpin:
	nop
	# b gameLoopSpin
	# NO INTERRUPTS FOR TESTING
	# NO CRYING IN BASEBALL
	b GameLoop


updateGround:
	# params:
	# $a0 x coord
	# $a1 y coord
	# $a2 which dir we're facing (0:up 1:left 2:down 3:right)
	nop
	# t0 holds the shifted y coord
	push $t0
	# t1 holds the word in the ground table
	push $t1
	# t2 holds the position to be put in the groundTable
	push $t2
	# t3 holds the x value that is destroyed to give $t2
	push $t3
	# t4 holds temp values for generating $t2
	push $t4
	
	srl $t0,$a1,3
	srl $t3,$a0,3
	lw $t1,$t0,groundData
	li $t2,1
	
	li $t4,16
	sub $zero,$t3,$t4
	blt shift8
	sub $t3,$t3,16
	sll $t2,$t2,16
	
	shift8:
	li $t4,8
	sub $zero,$t3,$t4
	blt shift4
	sub $t3,$t3,8
	sll $t2,$t2,8
	
	shift4:
	li $t4,4
	sub $zero,$t3,$t4
	blt shift2
	sub $t3,$t3,4
	sll $t2,$t2,4
	
	shift2:
	li $t4,2
	sub $zero,$t3,$t4
	blt shift1
	sub $t3,$t3,2
	sll $t2,$t2,2
	
	shift1:
	li $t4,1
	sub $zero,$t3,$t4
	blt endShift
	sub $t3,$t3,1
	sll $t2,$t2,1
	
	endShift:
	add $a0,$t2,$zero
	add $a1,$t1,$zero
	call or
	
	sw $v0,$t0,groundData
	
	# CHECK FOR COLISSIONS
	li $t3,0
	sub $zero,$t3,$a2
	bne checkLeft
	addi $t0,$t0,-1
	lw $t1,$t0,groundData
	and $t5,$t1,$t2
	beq checkLeft
	addi $s3,$zero,1
	
	checkLeft:
	li $t3,1
	sub $zero,$t3,$a2
	bne checkDown
	sll $t2,$t2,1
	lw $t1,$t0,groundData
	and $t5,$t1,$t2
	beq checkDown
	addi $s3,$zero,1
	
	checkDown:
	li $t3,2
	sub $zero,$t3,$a2
	bne checkRight
	addi $t0,$t0,1
	lw $t1,$t0,groundData
	and $t5,$t1,$t2
	beq checkRight
	addi $s3,$zero,1
	
	checkRight:
	li $t3,3
	sub $zero,$t3,$a2
	bne endCheck
	srl $t2,$t2,1
	lw $t1,$t0,groundData
	and $t5,$t1,$t2
	beq endCheck
	addi $s3,$zero,1
	
	
	endCheck:
	pop $t4
	pop $t3
	pop $t2
	pop $t1
	pop $t0
	ret


p1displayupdate:
	# $t0 holds comparison values 
		push $t0
	# t1 holds OAM value of sprite
		push $t1
	# t2 holds sprite position
		push $t2
	# t3 holds the attributes of the sprite 
		push $t3
	# t4 holds the current sprite in the pattern table
		push $t4
		
		
	# what do we do if p1 is facing 'w'
		li $t1, 0
	updatespritew:
		li $t0,0x77
		sub $zero,$t0,$s2
		bne updatespritea		
		
	# put the sprite in the OAM
		li $t4,light_bike_small_index
		sft $t1,$t4
	# set the location of the sprite
		addi $t2,$s0,0
		sll $t2,$t2,8
		add $t2,$t2,$s1
	# add 8 so the center of the bike is its location
		addi $t2,$t2,-8
		ssl $t1,$t2
	# set the attributes (flip) of the sprite
		li $t3,0x01
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		addi $t4,$t4,1
		sft $t1,$t4
	# set the location of the sprite
	# direction is up, so next sprite is 8 below
	# the last sprite 
		addi $t2,$t2,8
		ssl $t1,$t2
	# set the attributes (flip) of the sprite
	# TODO determine color palette
		li $t3,0x01
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		addi $t4,$t4,1
		sft $t1,$t4
	# set the location of the sprite
	# direction is up, so next sprite is 8 below
	# the last sprite 
		addi $t2,$t2,8
		ssl $t1,$t2
	# set the attributes (flip) of the sprite
	# TODO determine color palette
		li $t3,0x01
		sfa $t1,$t3
		b end_p1displayupdate
		
		
	updatespritea:
		li $t0,0x61
		sub $zero,$t0,$s2
		bne updatesprites
		
	# put the sprite in the OAM
		li $t4,light_bike_small_rotated_index
		sft $t1,$t4
	# set the location of the sprite
		addi $t2,$s0,0
		sll $t2,$t2,8
		add $t2,$t2,$s1
		ssl $t1,$t2
	# set the attributes of the sprite
	# flip both x, y, so MSB is 0xC
	# TODO determine color palette
		li $t3,0xC1
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		addi $t4,$t4,1
		sft $t1,$t4
	# set the location of the sprite
	# direction is left, so next sprite is 8 right of
	# the last sprite 
		addi $t2,$t2,-0x800
		ssl $t1,$t2
	# set the attributes of the sprite
	# flip both x, y, so MSB is 0xC
	# TODO determine color palette
		li $t3,0xC1
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		addi $t4,$t4,1
		sft $t1,$t4
	# set the location of the sprite
	# direction is left, so next sprite is 8 right of
	# the last sprite 
		addi $t2,$t2,-0x800
		ssl $t1,$t2
	# set the attributes of the sprite
	# flip both x, y, so MSB is 0xC
	# TODO determine color palette
		li $t3,0xC1
		sfa $t1,$t3
		b end_p1displayupdate
		
	updatesprites:
		li $t0,0x73
		sub $zero,$t0,$s2
		bne updatesprited
		
	# put the sprite in the OAM
		li $t4,light_bike_small_index
		sft $t1,$t4
	# set the location of the sprite
		add $t2,$zero,$s0
		sll $t2,$t2,8
		add $t2,$t2,$s1
		addi $t2,$t2,8
		ssl $t1,$t2
	# set the attributes of the sprite
	# flip just y, so MSB is 0x8
		li $t3,0x81
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		addi $t4,$t4,1
		sft $t1,$t4
	# set the location of the sprite
	# direction is down, so next sprite is 8 above
	# the last sprite 
		addi $t2,$t2,-8
		ssl $t1,$t2
	# set the attributes of the sprite
	# flip just y, so MSB is 0x8
		li $t3,0x81
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		addi $t4,$t4,1
		sft $t1,$t4
	# set the location of the sprite
	# direction is down, so next sprite is 8 above
	# the last sprite 
		addi $t2,$t2,-8
		ssl $t1,$t2
	# set the attributes of the sprite
	# flip just y, so MSB is 0x8
	# TODO determine color palette
		li $t3,0x81
		sfa $t1,$t3
		b end_p1displayupdate
		
	updatesprited:
		li $t0,0x64
		sub $zero,$t0,$s2
		bne end_p1displayupdate
				
		
	# put the sprite in the OAM
		li $t4,light_bike_small_rotated_index
		sft $t1,$t4
	# set the location of the sprite
		add $t2,$s0,8
		sll $t2,$t2,8
		add $t2,$t2,$s1
		ssl $t1,$t2
	# set the attributes of the sprite
	# no flip, so MSB is 0x0
	# Color pallette is 1, LSB is 0x1
		li $t3,0x81
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		addi $t4,$t4,1
		sft $t1,$t4
	# set the location of the sprite
	# direction is right, so next sprite is 8 left of
	# the last sprite 
		addi $t2,$t2,-0x800
		ssl $t1,$t2
	# set the attributes of the sprite
	# no flip, so MSB is 0x0
		li $t3,0x81
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		addi $t4,$t4,1
		sft $t1,$t4
	# set the location of the sprite
	# direction is right, so next sprite is 8 left of
	# the last sprite 
		addi $t2,$t2,-0x800
		ssl $t1,$t2
	# set the attributes of the sprite
	# no flip, so MSB is 0x0
		li $t3,0x81
		sfa $t1,$t3
		
		
	end_p1displayupdate:
		pop $t4
		pop $t3
		pop $t2
		pop $t1
		pop $t0
		ret
		
		
		
	p2displayupdate:
	# $t0 holds comparison values 
		push $t0
	# t1 holds OAM value of sprite
		push $t1
	# t2 holds sprite position
		push $t2
	# t3 holds the attributes of the sprite 
		push $t3
	# t4 holds the sprite index in the pallatte table
		push $t4
		
		
	# what do we do if p2 is facing 'i'
		li $t1, 3
	updatespritei:
		li $t0,0x69
		sub $zero,$t0,$s6
		bne updatespritej
		
	# put the sprite in the OAM
		li $t4,light_bike_small_index
		sft $t1,$t4
	# set the location of the sprite
		add $t2,$s4,$zero
		sll $t2,$t2,8
		add $t2,$t2,$s5
		addi $t2,$t2,-8
		ssl $t1,$t2
	# set the attributes (flip) of the sprite
	# TODO determine color palette
		li $t3,0x02
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		addi $t4,$t4,1
		sft $t1,$t4
	# set the location of the sprite
	# direction is up, so next sprite is 8 below
	# the last sprite 
		addi $t2,$t2,8
		ssl $t1,$t2
	# set the attributes (flip) of the sprite
	# TODO determine color palette
		li $t3,0x02
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		addi $t4,$t4,1
		sft $t1,$t4
	# set the location of the sprite
	# direction is up, so next sprite is 8 below
	# the last sprite 
		addi $t2,$t2,8
		ssl $t1,$t2
	# set the attributes (flip) of the sprite
	# TODO determine color palette
		li $t3,0x02
		sfa $t1,$t3
		b end_p2displayupdate
		
		
	updatespritej:
		li $t0,0x6A
		sub $zero,$t0,$s6
		bne updatespritek
		
	# put the sprite in the OAM
		li $t4,light_bike_small_rotated_index
		sft $t1,$t4
	# set the location of the sprite
		addi $t2,$s4,-8
		sll $t2,$t2,8
		add $t2,$t2,$s5
		ssl $t1,$t2
	# set the attributes of the sprite
	# flip both x, y, so MSB is 0xC
	# TODO determine color palette
		li $t3,0xC2
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		addi $t4,$t4,1
		sft $t1,$t4
	# set the location of the sprite
	# direction is left, so next sprite is 8 right of
	# the last sprite 
		addi $t2,$t2,0x800
		ssl $t1,$t2
	# set the attributes of the sprite
	# flip both x, y, so MSB is 0xC
	# TODO determine color palette
		li $t3,0xC2
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		addi $t4,$t4,1
		sft $t1,$t4
	# set the location of the sprite
	# direction is left, so next sprite is 8 right of
	# the last sprite 
		addi $t2,$t2,0x800
		ssl $t1,$t2
	# set the attributes of the sprite
	# flip both x, y, so MSB is 0xC
	# TODO determine color palette
		li $t3,0xC2
		sfa $t1,$t3
		b end_p2displayupdate
		
	updatespritek:
		li $t0,0x6B
		sub $zero,$t0,$s6
		bne updatespritel
		
	# put the sprite in the OAM
		li $t4,light_bike_small_index
		sft $t1,$t4
	# set the location of the sprite
		add $t2,$s4,$zero
		sll $t2,$t2,8
		add $t2,$t2,$s5
		addi $t2,$t2,8
		ssl $t1,$t2
	# set the attributes of the sprite
	# flip just y, so MSB is 0x8
		li $t3,0x82
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		addi $t4,$t4,1
		sft $t1,$t4
	# set the location of the sprite
	# direction is down, so next sprite is 8 above
	# the last sprite 
		addi $t2,$t2,-8
		ssl $t1,$t2
	# set the attributes of the sprite
	# flip just y, so MSB is 0x8
		li $t3,0x82
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		addi $t4,$t4,1
		sft $t1,$t4
	# set the location of the sprite
	# direction is down, so next sprite is 8 above
	# the last sprite 
		addi $t2,$t2,-8
		ssl $t1,$t2
	# set the attributes of the sprite
	# flip just y, so MSB is 0x8
	# TODO determine color palette
		li $t3,0x82
		sfa $t1,$t3
		b end_p2displayupdate
		
	updatespritel:
		li $t0,0x6C
		sub $zero,$t0,$s6
		bne end_p2displayupdate
		
	# put the sprite in the OAM
		li $t4,light_bike_small_rotated_index
		sft $t1,$t4
	# set the location of the sprite
		addi $t2,$s4,8
		sll $t2,$t2,8
		add $t2,$t2,$s5
		ssl $t1,$t2
	# set the attributes of the sprite
	# no flip, so MSB is 0x0
	# TODO determine color palette
		li $t3,0x82
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		addi $t4,$t4,1
		sft $t1,$t4
	# set the location of the sprite
	# direction is right, so next sprite is 8 left of
	# the last sprite 
		addi $t2,$t2,-0x800
		ssl $t1,$t2
	# set the attributes of the sprite
	# no flip, so MSB is 0x0
		li $t3,0x82
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		addi $t4,$t4,1
		sft $t1,$t4
	# set the location of the sprite
	# direction is right, so next sprite is 8 left of
	# the last sprite 
		addi $t2,$t2,-0x800
		ssl $t1,$t2
	# set the attributes of the sprite
	# no flip, so MSB is 0x0
	# TODO determine color palette
		li $t3,0x82
		sfa $t1,$t3
		
		
	end_p2displayupdate:
		pop $t4
		pop $t3
		pop $t2
		pop $t1
		pop $t0
		ret
		
		
		
GameFail:
	li $t1,middle_finger_index
	li $t0,6
	sft $t0,$t1
	
	# Set the proper location
	# addi ... 8 because the middle is "where the bike is"
	li $t2,128
	sll $t2,$t2,8
	addi $t2,$t2,126
	ssl $t0,$t2

	# Set attributes
	addi $t3,$zero,0x41
	sfa $t0,$t3
	nop
	nop
	nop
	
	
#####################################################
# or: Gives the logical or of two arguments
# Someone please put me out of my misery 
#
# Arguments:
#   $a0 - A
#   $a1 - B
#
# Returns:
#   $v0 - A OR B
#
##################################################### 
or: nop
    push $t0
    push $t1
    nand $t0,$a0,$a0
    #addi $t0,$t0,1
    nand $t1,$a1,$a1
    #addi $t1,$t1,1 
    nand $v0,$t0,$t1
    pop $t1
    pop $t0
    ret  
	
        
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
