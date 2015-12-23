nop

run:		# Test the basic ALU ops
	addi $t0, $t0, 0x7777777
	addi $t1, $t1, 0x8888888
	add  $t2, $t0, $t1
	# t2 should contain 0xFFFFFFFF

call	stop


	addi $t7, $t7 0xFFFFFFFF
	call end
	
stop:
	return
	nop

end: nop
