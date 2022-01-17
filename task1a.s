# 1st task(a): code with problem

	.data
	
		atable: .byte 0, 0, 0, 0
		btable: .byte 10, 5, 5, 20
		ctable: .byte 10, 4, 5, 1
		
	.text
	
	.globl main
	
	main:
	
		add $t4, $zero, $zero 			# i is initialized to 0, $t4 = 0
		la $t0, atable
		la $t1, btable
		la $t2, ctable
		
	Loop:
	
		add $t5, $t4, $t1 				# $t5 = address of b[i]
		lw $t6, 0($t5)					# $t6 = b[i]
		
		add $t5, $t4, $t2 				# $t5 = address of c[i]
		lw $t7, 0($t5)					# $t7 = c[i]
		add $t6, $t6, $t7				# $t6 = b[i] + c[i]
		
		add $t5, $t4, $t0 				# $t5 = address of a[i]
		sw $t6, 0($t5) 					# a[i] = b[i] + c[i]
		
		addi $t4, $t4, 4 				# i = i + 4
		
		slti $t5, $t4, 4 				# $t5 = 1 if $t4 < 4, i.e. i < 2
		bne $t5, $zero, Loop 			# go to Loop if i <> 0
		
		jr $ra

	exit:
	
		li $v0, 10
		syscall