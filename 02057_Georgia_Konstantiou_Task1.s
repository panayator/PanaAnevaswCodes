# 1st task

	.data

		name: .asciiz "Give Name "
		am: .asciiz "Give AM "

	.text

	main:

# For the name

		li $v0, 4
		la $a0, name
		syscall

		li $v0, 8
		li $a1, 225
		syscall

		li $v0, 4
		syscall

# For the AM

		li $v0, 4
		la $a0, am
		syscall

		li $v0, 5
		syscall

		move $t0, $v0
		li $v0, 1
		move $a0, $t0
		syscall

# End of the code

		li $v0, 10 
		syscall
		
		
		
		
		