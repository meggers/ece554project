		li $t0, 0
		li $t2,background3330_index
		sbt $t0,$t2
		li $t0, 31
		li $t2,background3303_index
		sbt $t0,$t2
		li $t0, 992
		li $t2,background3033_index
		sbt $t0,$t2
		li $t0, 1023
		li $t2,background0333_index
		sbt $t0,$t2
		
game_tick_interrupt:	
	nop

keyboard_interrupt:
	nop

stack_ov_interrupt:
	nop