# 1st task: Print the numbers from 1 to 10

	.data

		done: .asciiz "\nThese were the numbers from 1 to 10.\n"
		nextnum: .asciiz "\n"

	.text
	
	.globl main

	main:

# Initialize t0 and t1

		li $t0, 1
		li $t1, 10
		
# The Loop

	loop:  
		
		bgt $t0, $t1, exit

		li $v0, 1
		move $a0, $t0
		syscall
	  
		li $v0,4
		la $a0, nextnum
		syscall
	  
		addi $t0, $t0, 1
	  
		j loop
	 
# Exit Label	 
	
	exit:

		la $a0,done
		li $v0,4
		syscall 

# Return to caller

		li $v0, 10 
		syscall