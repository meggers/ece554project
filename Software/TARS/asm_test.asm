.word 0x00000000

.text
	beq $t0,$t0,quit
	bne $t0,$t0,quit
	blt $t0,$t0,quit
	#b quit
	call quit
	Return
	
	lw $t0,0x40
	li $t0,6
	pop $t5
	sw $t0,0x40
	push $t0
	
	add $t0,$t0,$t0
	addi $t0,$t0,1
	sub $t0,$t0,$t0
	nand $t0,$t0,$t0
	and $t0,$t0,$t0
	andi $t0,$t0,1
	srl $t0,$t0,2
	sll $t0,$t0,2
	xor $t0,$t0,$t0





quit:
