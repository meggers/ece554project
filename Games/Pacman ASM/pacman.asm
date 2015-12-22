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
			0xFDA05BF0,
			0x00204000,
			0xFDA05BF0,
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
# $s7 is isAllowInterrupts
.text
	li $s7, 0
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
	li $s7, 1	# $s7 is isAllowInterrupts
	nop

#s0 is current location
#s1 is direction
#s2 is nextDirection
#s3 is index into wall
#s4 is index into entire wall
#s5 is division, ($s3/8)
waitForInterrupt:
	nop
	b 0
	nop
	b waitForInterrupt
	
game_loop:
	nop
	li $s4, wall
	addi $0, $s1, -97 # a
	beq checkNextLeft
	addi $0, $s1, -119 # w
	beq checkNextUp
	addi $0, $s1, -115 # s
	beq checkNextDown
	addi $0, $s1, -100 # 'd'
	beq checkNextRight
	nop
	jr $epc
	
	checkNextLeft:
		nop
		li $s5, 0
		andi $s3, $s0, 0x000000FF
		startDivide1:
		nop
		addi $0, $s3, -8
		blt doneDivide1
		addi $s5, $s5, 1
		addi $s3, $s3, -8
		b startDivide1
		doneDivide1:
		add $s3, $s4, $s5
		lw $s4, $s3, 0
		andi $s5, $s0, 0x0000FF00
		srl $s6, $s5, 8 # get x location
		addi $s6, $s6, -1 # subtract 1 to simulate moving left
		li $s5, 256
		sub $s6, $s5, $s6 # find index from right
		startDivide2:
		nop
		addi $0, $s6, -8
		blt doneDivide2
		srl $s4, $s4, 1
		addi $s6, $s6, -8
		b startDivide2
		doneDivide2:
		and $0, $s4, 1
		bne updatePacmanLocation
		add $s6, $s0, -256
		srl $s6, $s6, 8
		andi $s6, $s6, 0x000000FF
		sll $s6, $s6, 8
		andi $s0, $s0, 0x000000FF
		add $s0, $s0, $s6
		b updatePacmanLocation
	
	checkNextUp:
		nop
		li $s5, 0
		andi $s3, $s0, 0x000000FF
		addi $s3, $s3, -1 # minus 1 to simulate moving up
		startDivide5:
		nop
		addi $0, $s3, -8
		blt doneDivide5
		addi $s5, $s5, 1
		addi $s3, $s3, -8
		b startDivide5
		doneDivide5:
		add $s3, $s4, $s5
		lw $s4, $s3, 0
		andi $s5, $s0, 0x0000FF00
		srl $s6, $s5, 8 # get x location
		li $s5, 256
		sub $s6, $s5, $s6 # find index from right
		startDivide6:
		nop
		addi $0, $s6, -8
		blt doneDivide6
		srl $s4, $s4, 1
		addi $s6, $s6, -8
		b startDivide6
		doneDivide6:
		and $0, $s4, 1
		bne updatePacmanLocation
		addi $s0, $s0, -1
		b updatePacmanLocation
		
	checkNextDown:
		nop
		li $s5, 0
		andi $s3, $s0, 0x000000FF
		addi $s3, $s3, 1 # plus 1 to simulate moving down
		startDivide7:
		nop
		addi $0, $s3, -8
		blt doneDivide7
		addi $s5, $s5, 1
		addi $s3, $s3, -8
		b startDivide7
		doneDivide7:
		add $s3, $s4, $s5
		lw $s4, $s3, 0
		andi $s5, $s0, 0x0000FF00
		srl $s6, $s5, 8 # get x location
		li $s5, 256
		sub $s6, $s5, $s6 # find index from right
		startDivide8:
		nop
		addi $0, $s6, -8
		blt doneDivide8
		srl $s4, $s4, 1
		addi $s6, $s6, -8
		b startDivide8
		doneDivide8:
		and $0, $s4, 1
		bne updatePacmanLocation
		addi $s0, $s0, 1
		b updatePacmanLocation
		
	checkNextRight:
		nop
		li $s5, 0
		andi $s3, $s0, 0xFF
		startDivide3:
		nop
		addi $0, $s3, -8
		blt doneDivide3
		addi $s5, $s5, 1
		addi $s3, $s3, -8
		b startDivide3
		doneDivide3:
		add $s3, $s4, $s5
		lw $s4, $s3, 0
		andi $s5, $s0, 0xFF00
		srl $s6, $s5, 8 # get x location
		addi $s6, $s6, 1 # add 1 to simulate moving right
		li $s5, 256
		sub $s6, $s5, $s6 # find index from right
		startDivide4:
		nop
		addi $0, $s6, -8
		blt doneDivide4
		srl $s4, $s4, 1
		addi $s6, $s6, -8
		b startDivide4
		doneDivide4:
		and $0, $s4, 1
		bne updatePacmanLocation
		add $s6, $s0, 256
		srl $s6, $s6, 8
		andi $s6, $s6, 0x000000FF
		sll $s6, $s6, 8
		andi $s0, $s0, 0x000000FF
		add $s0, $s0, $s6
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

do_game_loop:
	nop
	li $t10, 6
	b game_loop

maybe_game_loop:
	nop
	#b do_game_loop # remove to make slower
	addi $t10, $t10, 0
	beq do_game_loop
	addi $t10, $t10, -1
	jr $epc
	

	nop
game_tick_interrupt:
	nop
	add $0, $s7, 0
	bne maybe_game_loop
	nop
	jr $epc
	
	nop
keyboard_interrupt:
	nop
	b handle_key_press
