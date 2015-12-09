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
	p1xCoord:	.word	64
	p1yCoord:	.word	128
	p1dir:		.byte	0x64 # used for PPU, not here
	p2xCoord:	.word	192
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
	
	# We need a 2d array of game positions covering the entire board for background information (where
	# the line was) and collision detection idk how to do this lol
	
	
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
	# TODO tweak starting locations
	# p1 x coord = 12
	lw $s0,($0)p1xCoord
	# p1 y coord = 32
	lw $s1,($0)p1yCoord
	# player 1 direction = 'd'
	li $s2, 0x64
	
	# p2 x coord = 51
	lw $s4,($0)p2xCoord
	# p2 y coord = 32
	lw $s5,($0)p2yCoord
	# player 2 direction = 'j'
	li $s6, 0x6A
					
LoadFrontSprites: 	# Load the sprites from the pattern table into the OAM
					# Set the attributes of the sprites for the beginning of the game

	
	# Put one copy of light_bike (p1) rotated pi/2 right into OAM
	add $t0,$zero,$zero
	li $t1,light_bike_small_rotated_index
	sft $t0,$t1
	# Set the proper location
	add $t2,$s0,$zero
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
	add $t2,$s4,$zero
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
		bne gameLoopSpin
		addi $s0, $s0, 1
		call p2displayupdate
	
	# Update array 
	
	# Check for collision (Branch to end if collision)
gameLoopSpin:
	nop
	b gameLoopSpin



p1displayupdate:
	# Push the ret address 
		push $ra
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
		bne updatespritea
		
		# $a0 = sprite index
		li $a0,0
		# $a1 = sprite height
		li $a1,3
		# $a2 = sprite width
		li $a2,1
		# $a3 = starting attribute
		li $a3,0x01
		call load_sprite_img
		
		# $a0 - Sprite Register Layout formatted data
		li $a0,0
		# $a1 - x data to set (lsb 8 bits)
		add $a1,$zero,$s0
		call set_x
		
		# $a0 - Sprite Register Layout formatted data
		li $a0,0
		# $a1 - y data to set (lsb 8 bits)
		add $a1,$zero,$s1
		call set_y
		
		
	# put the sprite in the OAM
		# sft $t1,light_bike2_0
	# set the location of the sprite
		# ssl $t1,$s0,$s1
	# set the attributes (flip) of the sprite
	# TODO determine color palette
		li $t3,0x00
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike2_1
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
		# sft $t1,light_bike2_2
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
		# sft $t1,light_bike_small_rotated_0
	# set the location of the sprite
		# ssl $t1,$s0,$s1
	# set the attributes of the sprite
	# flip both x, y, so MSB is 0xC
	# TODO determine color palette
		li $t3,0xC0
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_small_rotated_1
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
		# sft $t1,light_bike_small_rotated_0
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
		# sft $t1,light_bike2_0
	# set the location of the sprite
		# ssl $t1,$s0,$s1
	# set the attributes of the sprite
	# flip just y, so MSB is 0x8
	# TODO determine color palette
		li $t3,0x80
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike2_1
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
		# sft $t1,light_bike2_0
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
		# sft $t1,light_bike_small_rotated_0
	# set the location of the sprite
		# ssl $t1,$s0,$s1
	# set the attributes of the sprite
	# no flip, so MSB is 0x0
	# TODO determine color palette
		li $t3,0x80
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_small_rotated_1
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
		# sft $t1,light_bike_small_rotated_2
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
		pop $ra
		ret
		
		
		
	p2displayupdate:
	# Push the ret address
		push $ra
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
		# sft $t1,light_bike2_0
	# set the location of the sprite
		# ssl $t1,$s0,$s1
	# set the attributes (flip) of the sprite
	# TODO determine color palette
		li $t3,0x0F
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike2_1
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
		# sft $t1,light_bike2_0
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
		# sft $t1,light_bike_small_rotated_0
	# set the location of the sprite
		# ssl $t1,$s0,$s1
	# set the attributes of the sprite
	# flip both x, y, so MSB is 0xC
	# TODO determine color palette
		li $t3,0xCF
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_small_rotated_1
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
		# sft $t1,light_bike2_0
	# set the location of the sprite
		# ssl $t1,$s0,$s1
	# set the attributes of the sprite
	# flip just y, so MSB is 0x8
	# TODO determine color palette
		li $t3,0x8F
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike2_1
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
		# sft $t1,light_bike2_0
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
		# sft $t1,light_bike_small_rotated_0
	# set the location of the sprite
		# ssl $t1,$s0,$s1
	# set the attributes of the sprite
	# no flip, so MSB is 0x0
	# TODO determine color palette
		li $t3,0x8F
		sfa $t1,$t3
		
	# put the sprite in the OAM
		addi $t1,$t1,1
		# sft $t1,light_bike_small_rotated_1
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
		# sft $t1,light_bike_small_rotated_2
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
		pop $ra
		ret


#####################################
#                                   #
# FUNCTION: load_sprite_img         #
#                                   #
# DEFN: load sprite into oam        #
#                                   #
# ARGUMENTS:                        #
#   $a0: sprite index               #
#   $a1: sprite height              #
#   $a2: sprite width               #
#   $a3: Starting Attr              #
#    (in Sprite Register Layout)    #
#                                   #
#####################################
load_sprite_img:                    #
    push $ra                        #
    push $t0                        #
    push $t1                        #
    push $t2                        #
                                    #
    li $t0,0                        # $t0 = 0 ; outer loop index (height)
    li $t1,0                        # $t1 = 0 ; inner loop index (width)
    li $t3,0                        # cur_sprite = 0
                                    #
    load_sprite_oloop:              #
        sub $zero,$t0,$a1           #
        beq load_sprite_ret         #
                                    #
        load_sprite_iloop:          #
            sub $zero,$t1,$a2       #
            beq rst_sprite_iloop    #
                                    #            
            add $t2,$a0,$t3         # $t2 = sprite index + loop index
            sft $a3,$t2             # set sprite index in oam
            addi $t3,$t3,1          # $t0 += 1 ; Increment loop index
            addi $a3,$a3,1          # $a3 += 1 ; Increment oam index
                                    #
            addi $t1,$t1,1          # increment inner loop index
            b load_sprite_iloop     #
                                    #
        rst_sprite_iloop:           #
            li $t1,0                # reset inner loop index
            addi $t0,$t0,1          # increment outer loop index
            b load_sprite_oloop     # 
                                    #
    load_sprite_ret:                #
    	pop $t2                     #
    	pop $t1                     #
    	pop $t0                     #
    	pop $ra                     #
        ret                         #
        
#####################################################
# set_x: Sets x value in sprite register layout data
#
# Arguments:
#   $a0 - Sprite Register Layout formatted data
#   $a1 - x data to set (lsb 8 bits)
#
# Returns:
#   $v0 - SRL data with new x
#
#####################################################
set_x:
    lw $t0,($0)x_mask
    nand $t0,$t0,$t0
    and $v0,$a0,$t0
    sll $a1,$a1,24
    xor $v0,$v0,$a1
    ret
    
#####################################################
# set_x: Sets y value in sprite register layout data
#
# Arguments:
#   $a0 - Sprite Register Layout formatted data
#   $a1 - y data to set (lsb 8 bits)
#
# Returns:
#   $v0 - SRL data with new y
#
#####################################################
set_y:
    lw $t0,($0)y_mask
    and $t1,$t0,$a1
    nand $t0,$t0,$t0
    and $v0,$a0,$t0
    xor $v0,$v0,$t1
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
