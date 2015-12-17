# $s0 is location of char
# $s2 is temp
# $s3 is score
# $s4 = 'a'
# $s5 = 'w'
# $s6 = 's'
# $s7 = 'd'

.text
	li $s3, 0
	li $t7, 16
	call displayScore
	b main
	
	displayScore:
		li $t4, 0
		addi $s3, $s3, 0
		blt resetAndReturnFromDisplayScore
		add $t3, $0, $s3
		startDivide:
			addi $t3, $t3, -10
			blt doneDivide
			addi $t4, $t4, 1
			b startDivide
		doneDivide:
			addi $t3, $t3, 10
			addi $0, $t4, -9
			beq display90
			addi $0, $t4, -8
			beq display80
			addi $0, $t4, -7
			beq display70
			addi $0, $t4, -6
			beq display60
			addi $0, $t4, -5
			beq display50
			addi $0, $t4, -4
			beq display40
			addi $0, $t4, -3
			beq display30
			addi $0, $t4, -2
			beq display20
			addi $0, $t4, -1
			beq display10
			li $t4, char_0_index
		endDisplay10s:
			li $t5, 30
			sbt $t5, $t4
			li $t4, 2
			sba $t5, $t4
			addi $0, $t3, -9
			beq display9
			addi $0, $t3, -8
			beq display8
			addi $0, $t3, -7
			beq display7
			addi $0, $t3, -6
			beq display6
			addi $0, $t3, -5
			beq display5
			addi $0, $t3, -4
			beq display4
			addi $0, $t3, -3
			beq display3
			addi $0, $t3, -2
			beq display2
			addi $0, $t3, -1
			beq display1
			li $t4, char_0_index
		endDisplay1s:
			li $t5, 31
			sbt $t5, $t4
			li $t4, 2
			sba $t5, $t4
			ret
	display90:
		li $t4, char_9_index
		b endDisplay10s
	display80:
		li $t4, char_8_index
		b endDisplay10s
	display70:
		li $t4, char_7_index
		b endDisplay10s
	display60:
		li $t4, char_6_index
		b endDisplay10s
	display50:
		li $t4, char_5_index
		b endDisplay10s
	display40:
		li $t4, char_4_index
		b endDisplay10s
	display30:
		li $t4, char_3_index
		b endDisplay10s
	display20:
		li $t4, char_2_index
		b endDisplay10s
	display10:
		li $t4, char_1_index
		b endDisplay10s
		
	display9:
		li $t4, char_9_index
		b endDisplay1s
	display8:
		li $t4, char_8_index
		b endDisplay1s
	display7:
		li $t4, char_7_index
		b endDisplay1s
	display6:
		li $t4, char_6_index
		b endDisplay1s
	display5:
		li $t4, char_5_index
		b endDisplay1s
	display4:
		li $t4, char_4_index
		b endDisplay1s
	display3:
		li $t4, char_3_index
		b endDisplay1s
	display2:
		li $t4, char_2_index
		b endDisplay1s
	display1:
		li $t4, char_1_index
		b endDisplay1s
		
	resetAndReturnFromDisplayScore:
		li $s3, 0
		ret
	main:
		li $t2, 2
		li $t0, 24
		li $t1, char_S_index
		sbt $t0, $t1
		sba $t0, $t2
		li $t0, 25
		li $t1, char_C_index
		sbt $t0, $t1
		sba $t0, $t2
		li $t0, 26
		li $t1, char_O_index
		sbt $t0, $t1
		sba $t0, $t2
		li $t0, 27
		li $t1, char_R_index
		sbt $t0, $t1
		sba $t0, $t2
		li $t0, 28
		li $t1, char_E_index
		sbt $t0, $t1
		sba $t0, $t2
		li $s3, 0
		li $s4, 'a'
		li $s5, 'w'
		li $s6, 's'
		li $s7, 'd'
		li $t2, 1
		li $t0, 102
		li $t1, char_A_index
		sbt $t0, $t1
		sba $t0, $t2
		li $t0, 108
		li $t1, char_W_index
		sbt $t0, $t1
		sba $t0, $t2
		li $t0, 114
		li $t1, char_S_index
		sbt $t0, $t1
		sba $t0, $t2
		li $t0, 120
		li $t1, char_D_index
		sbt $t0, $t1
		sba $t0, $t2
		li $t0, 160
		li $t1, background1100_index
		li $t2, 3
		addLine:
		sbt $t0, $t1
		sba $t0, $t2
		subi $t0, $t0, -1
		addi $0, $t0, -192
		blt addLine
		
		li $t1, ddr_A_index
		li $s1, 0
		li $s0, 0
		sft $s1, $t1
		li $t1, 'a'
		sfa $s1, $s0
		li $s0, 12524 # 256*8*6+254

waitForInterrupt:
	nop
	b 0
	#add $t7, $t7, 1
	#nop
	b waitForInterrupt
	
game_loop:
	nop
	add $t0, $0, $s0
	addi $t0, $t0, -1
	#add $s2, $0, $epc # random letter generate
	add $s2, $0, $t7
	andi $t0, 0x000000FF
	beq doNextLetterFromGameLoop
	andi $s0, 0x0000FF00
	add $s0, $s0, $t0
	ssl $s1, $s0
	jr $epc

handle_key_press:
	nop
	sub $0, $t1, $idr
	beq mayBeAddPoint
	subtractPoint:
		addi $s3, $s3, -1
		b doNextLetter

	mayBeAddPoint:
		add $s2, $0, $s0
		andi $s2, 0xFF
		li $t6, 44
		sub $0, $s2, $t6
		blt addPoint
		addi $s3, $s3, -1
		b doNextLetter
	
	addPoint:
		nop
		addi $s3, $s3, 1
		
	doNextLetter:
		li $s2, -1
		call displayScore
	doNextLetterFromGameLoop:
		xor $s2, $s2, $s3
		andi $s2, 0x03
		li $s1, 0
		sub $0, $s2, $s1
		beq loadA
		li $s1, 1
		sub $0, $s2, $s1
		beq loadW
		li $s1, 2
		sub $0, $s2, $s1
		beq loadS
	
	loadD:
		li $t1, ddr_D_index
		li $s1, 0
		sft $s1, $t1
		li $t1, 'd'
		li $s0, 49406 # 256*8*6*3+254
		jr $epc

	loadA:
		li $t1, ddr_A_index
		li $s1, 0
		sft $s1, $t1
		li $t1, 'a'
		li $s0, 12524 # 256*8*6+254
		jr $epc
		
	loadW:
		li $t1, ddr_W_index
		li $s1, 0
		sft $s1, $t1
		li $t1, 'w'
		li $s0, 24830 # 256*8*6*2+254
		jr $epc
		
	loadS:
		li $t1, ddr_S_index
		li $s1, 0
		sft $s1, $t1
		li $t1, 's'
		li $s0, 37118 # 256*8*6*3+254
		jr $epc

before_game_loop:
	li $t7, 2
	b game_loop
	
	nop
game_tick_interrupt:
	nop
	addi $t7, $t7, -1
	blt before_game_loop
	jr $epc
	
	nop
keyboard_interrupt:
	nop
	b handle_key_press
	
	nop
stack_ov_interrupt:
	nop
	jr $epc
