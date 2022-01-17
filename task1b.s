# 1st task(b): the correct code

	.data
	
		atable: .byte 0, 0, 0, 0
		btable: .byte 10, 252, 251, 10
		ctable: .byte 10, 5, 6, 1
		
	.text
	
	.globl main
	
	main:
	
		add $t4, $zero, $zero 			
		la $t0, atable
		la $t1, btable
		la $t2, ctable
		
	Loop:
	
		add $t5, $t4, $t1 				
		lb $t6, 0($t5)					# 1st change	
		
		add $t5, $t4, $t2 				
		lb $t7, 0($t5)					# 2nd change 
		add $t6, $t6, $t7				
		
		add $t5, $t4, $t0 				
		sb $t6, 0($t5) 					# 3rd change
		
		addi $t4, $t4, 1 				# 4th change
		
		slti $t5, $t4, 4 				
		bne $t5, $zero, Loop 			
		
		jr $ra

	exit:
	
		li $v0, 10
		syscall