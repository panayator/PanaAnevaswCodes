# Task 1: from little endian to big endian

	.data
	
		test: .space 4
		
	.text
	
	.globl main
	
	main:
	
	li $t0, 0x11223344
	la $t1, test
	sw $t0, ($t1)

# For the bits in the edges
	
	lb $t2, ($t1)
	lb $t3, 3($t1)
	sb $t3, ($t1)
	sb $t2, 3($t1)
	
# For the bits in the middle	
	
	lb $t2, 1($t1)
	lb $t3, 2($t1)
	sb $t3, 1($t1)
	sb $t2, 2($t1)
	
# Exit
	
	jr $ra