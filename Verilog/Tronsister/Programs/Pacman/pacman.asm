.data
	wall:	.word	
			0xFFFFFFF0, 
			0x80060010,
			0xBDF6FBD0,
			0xBDF6FBD0,
			0xBDF6FBD0,
			0x80000010,
			0xBDBFDBD0,
			0xBDBFDBD0,
			0x81861810,
			0xFDF6FBF0,
			0xFDF6FBF0,
			0xFD801BF0,
			0xFDBFDBF0,
			0xFDBFDBF0,
			0x003FC000,
			0xFDBFDBF0,
			0xFDBFDBF0,
			0xFD801BF0,
			0xFDBFDBF0,
			0xFDBFDBF0,
			0x80060010,
			0xBDF6FBD0,
			0xBDF6FBD0,
			0x8C000310,
			0xEDBFDB70,
			0xEDBFDB70,
			0x81861810,
			0xBFF6FFD0,
			0xBFF6FFD0,
			0x80000010,
			0xFFFFFFF0

# $t0 is wall
# $t1 is index into wall
# $t2 is downCounter for entire line
# $t3 is 1 bit
# $t4 is index to load
# $t5 is downCounter for allow lines
# $t6 is total background line
# $t7 is index to load into
# $s3 is 3
.text
	li $t0, wall
	lw $t1, $t0, 0
	li $t5, 32
	li $t6, 0
	li $s3, 3
	startLoadingBackgroundEntire:
	nop
	li $t2, 32
	startLoadingBackgroundLine:
	nop
	addi $t2, $t2, 0
	beq finishedLoadingThisLine
	addi $t2, $t2, -1
	andi $t3, $t1, 1
	srl $t1, $t1, 1
	addi $t3, $t3, 0
	beq loadClear
	#loadWall:
	li $t4, background1111_index
	b loadWallOrClear
	loadClear:
	nop
	li $t4, background0000_index
	loadWallOrClear:
	nop
	add $t7, $t2, $t6
	sbt $t7, $t4
	sba $t7, $s3
	b startLoadingBackgroundLine
	
	finishedLoadingThisLine:
	nop
	addi $t5, $t5, -1
	beq finishedLoadingBackgroundEntire
	add $t0, $t0, 1
	addi $t6, $t6, 32
	lw $t1, $t0, 0
	b startLoadingBackgroundEntire
	
	finishedLoadingBackgroundEntire:
	nop
	# want pacman at (23Y, 13.5X) * 8
	# 13.5*8*256+23*8 = 27832
	li $t0, 0
	li $s1, ball_index # load pacman image
	li $s0, 2 # change pacman to be green
	sfa $t0, $s0
	sft $t0, $s1
	li $s0, 27832
	ssl $t0, $s0	# set pacman location
	li $s1, 'a'
	li $s2, 'a'
	nop
	nop

#s0 is current location
#s1 is direction
#s2 is nextDirection

waitForInterrupt:
	nop
	b 0
	nop
	b waitForInterrupt
	
game_loop:
	nop
	subi $0, $s1, 'a'
	beq checkNextLeft
	subi $0, $s1, 'w'
	beq checkNextUp
	subi $0, $s1, 's'
	beq checkNextDown
	subi $0, $s1, 'd'
	beq checkNextRight
	nop
	jr $epc
	
	checkNextLeft:
		nop
		addi $s0, $s0, -256
		nop
		b updatePacmanLocation
		
	checkNextUp:
		nop
		addi $s0, $s0, -1
		nop
		b updatePacmanLocation
		
	checkNextDown:
		nop
		addi $s0, $s0, 1
		nop
		b updatePacmanLocation
		
	checkNextRight:
		nop
		addi $s0, $s0, 256
		b updatePacmanLocation
	
	updatePacmanLocation:
		nop
		li $t0, 0
		ssl $t0, $s0
		jr $epc

handle_key_press:
	nop
	add $s1, $0, $idr
	jr $epc
	
	nop
game_tick_interrupt:
	nop
	b game_loop
	
	nop
keyboard_interrupt:
	nop
	b handle_key_press
