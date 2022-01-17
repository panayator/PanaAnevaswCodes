# 2nd task: Fibonacci Sequence

	.data

		integer: .asciiz "How many numbers do you want to be printed? "
		nextnum: .asciiz "\n"
		error: .asciiz "I can not give you 0 numpers. "

	.text
	
	.globl main

	main:
	
# Give Integer Label

	giveInteger:

		li $v0, 4
		la $a0, integer
		syscall

		li $v0, 5
		syscall

		move $t0, $v0
		
# Initialize t1, t2 and t3
				
		li $t1, 0
		li $t2, 0
		li $t3, 1
		
		beq $t1, $t0, problem
		
# Fibonacci Label
		
	fibonacci:		
		
		li $v0, 1
		move $a0, $t2
	    syscall

		add $t2, $t2, $t3
		
		addi $t1, $t1, 1
		
		beq $t1, $t0, exit
		
		li $v0,4
	    la $a0, nextnum
	    syscall		
		
		li $v0, 1
		move $a0, $t3
	    syscall

		add $t3, $t3, $t2
		
		beq $t1, $t0, exit
		
		addi $t1, $t1, 1
		
		li $v0,4
	    la $a0, nextnum
	    syscall
		
		bne $t1, $t0, fibonacci
		
		j exit
		
# Problem Label
		
	problem: 
		
		li $v0,4
	    la $a0, error
	    syscall
		
		j giveInteger
			
# Exit Label
		
		exit:
		
		li $v0, 10 
		syscall