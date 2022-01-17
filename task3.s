# Task 3: from little endian to big endian

	.data
	
		test: .space 4
		
	.text
	
	.globl main
	
	main:
	
	li $t0, 0x11223344
	la $t1, test
	sw $t0, ($t1)

# For the bits in the edges

	li $t2, 0xFF000000	
	and $t3, $t0, $t2	
	div $t3, $t3, 16777216		# change 1
	li $t2, 0x000000FF	
	and $t4, $t0, $t2	
	sb $t3, 0($t1)		
	sb $t4, 3($t1)	

# For the bits in the middle

	li $t2, 0x00FF0000	
	and $t5, $t0, $t2	
	div $t5, $t5, 65536			# change 2
	li $t2, 0x0000FF00	
	and $t6, $t0, $t2	
	div $t6, $t6, 256			# change 3
	sb $t5, 1($t1)		
	sb $t6, 2($t1)	
	
# Exit	
	
	jr $ra