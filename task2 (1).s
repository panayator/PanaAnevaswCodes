# 2nd task: capital

	.data
		
		msg: .asciiz "I need a hot chocolate!!!"
		msg1: .asciiz "Before: "
		msg2: .asciiz "After: "
		msg3: .asciiz "\n"
		
		# numbers: .asciiz "The number of characters and blank spaces: "
		
	.text
	
	.globl main
	
	main:
	
		li $v0, 4
		la $a0, msg1
		syscall
		
		li $v0, 4
		la $a0, msg
		syscall
		
		li $v0, 4
		la $a0, msg3
		syscall
		
# The Loop
		
	Loop:
	
		lb $t1, msg($t0)					
		
		beqz $t1, End
		
		blt $t1, 'a', Case
		bgt $t1, 'z', Case
		
		sub $t1, $t1, 32
		sb $t1, msg($t0)		

	j Loop
		
# The Case Label
		
	Case:
	
		addi $t0, $t0, 1
	
	j Loop
	
# The End Label
		
	End:
	
		li $v0, 4
		la $a0, msg3
		syscall
		
		li $v0, 4
		la $a0, msg2
		syscall
		
		li $v0, 4
		la $a0, msg
		syscall
		
		# li $v0, 4
		# la $a0, numbers
		# syscall
		
		# li $v0, 1
		# add $a0, $0, $t1
		# syscall 
		
# Return to caller
	
	li $v0, 10
	syscall