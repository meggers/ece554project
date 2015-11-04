.data
alla: .word 0xAAAAAAAA
allb: .word 0xBBBBBBBB
allc: .word 0xCCCCCCCC
alld: .word 0xDDDDDDDD
alle: .word 0xEEEEEEEE
allf: .word 0xFFFFFFFF
all5: .word 0x55555555
.text
	# Test the basic ALU ops
test1:
	# "andi" and "and"
	addi $t0, $zero, 0x7777
	addi $t1, $zero, 0x0888
	add  $t2, $t1,   $t0
	# t2 should contain 0x7FFF

	
	and $t0, $t0, $zero
	and $t1, $t1, $zero
	and $t2, $t2, $zero

	# "nand"
	addi $t0, $zero, 0xAA
	addi $t1, $zero, 0xCC
	nand  $t2, $t1,   $t0
	# $t2 should contain 0x777

	# "sub" and "sll"
	and $t0, $t0, $zero
	and $t1, $t1, $zero
	addi $t0, $t0, 1
	sll $t1, $t0, 30
	sub $t2, $t1, $t0

	
	# "push" and "pop"
	lw $t0, alla
	lw $t1, allb
	lw $t2, allc
	lw $t3, alld
	lw $t4, alle
	lw $t5, allf
	
	
	
	
	
	
	
test_call:
