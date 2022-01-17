# 2nd task

	.data

		integer: .asciiz "Give an Integer \n"
		integer2: .asciiz "\nOne more Integer, please \n"
		message: .asciiz "\nThe numbers are equal.\n"
		message1: .asciiz "\nThe numbers are not equal.\n"
		message2: .asciiz "\nThe greater number is number \n"
		message3: .asciiz "\nThe smaller number is number \n"

	.text

	.globl main

	main:

# For the first Integer 

		li $v0, 4
		la $a0, integer
		syscall

		li $v0, 5
		syscall

		move $t0, $v0

# For the second Integer 

		li $v0, 4
		la $a0, integer2
		syscall

		li $v0, 5
		syscall

		move $t1, $v0

		
# Compare: if equals

	beq $t0,$t1,Equal

# Not Equal Label

	notEqual:
	
		li $v0,4
		la $a0,message1
		syscall
		
		slt $t2,$t0,$t1

		bgtz $t2, Larger2
		
		j Larger1

# Equal Label
	
	Equal:
	
		li $v0,4
		la $a0,message
		syscall
		
		
# Larger1 Label
		
	Larger1:
		
		li $v0,4
		la $a0,message2
		syscall
		
		add $a0, $zero, $t0
		li $v0,1
		syscall
		
		li $v0,4
		la $a0,message3
		syscall
	
		li $v0,1
		add $a0, $zero, $t1
		syscall
		
		j exit
	
# Larger2 Label
		
	Larger2:
		
		li $v0,4
		la $a0,message2
		syscall

		li $v0,1
		add $a0, $zero, $t1
		syscall
		
		li $v0,4
		la $a0,message3
		syscall

		li $v0,1
		add $a0, $zero, $t0
		syscall
		
		j exit

# Exit Label

	exit:

# Return to caller

		li $v0, 10 
		syscall