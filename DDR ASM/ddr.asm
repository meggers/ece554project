.text
	li $t6, 1
	li $t7, 2
	li $t8, 3
	li $t4, light_bike_small_index
	sft $t0, $t4
	ssl $t0, $t5
	sfa $t0, $t5
	li $t0, 38
	li $t1, char_A_index
	sbt $t0, $t1
	sba $t0, $t6
	sba $t0, $t7
	sba $t0, $t8
	li $t0, 44
	li $t1, char_W_index
	sbt $t0, $t1
	li $t0, 50
	li $t1, char_S_index
	sbt $t0, $t1
	li $t0, 56
	li $t1, char_D_index
	sbt $t0, $t1
	li $t0, 0
	li $s0, light_bike_small_index
	sft $t0, $s0
	li $s4, 2303
	ssl $t0, $s4
	addi $s4, $s4, -1
	ssl $t0, $s4
	addi $s4, $s4, -1
	ssl $t0, $s4
	addi $s4, $s4, -1
	ssl $t0, $s4
	
