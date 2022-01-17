.data
 str: .asciiz "Please enter one number: "
 str0: .asciiz "and now another one: "
 str1: .asciiz "The two numbers are equal\n"
 str2: .asciiz "The two numbers are not equal\n"
 str3: .asciiz "The greater number is number "
 str4: .asciiz "\nThe smaller number is number "
 
 .text
 .globl main
 main: la $a0, str
 li $v0, 4
 syscall
 
 li $v0,5
 syscall
 move $t1, $v0
 
 la $a0, str0
 li $v0, 4
 syscall
 
 li $v0,5
 syscall
 move $t2, $v0
 
 beq $t1, $t2, equal
 
 la $a0, str2
 li $v0, 4
 syscall
 j ch2
 
 equal: la $a0, str1
 li $v0, 4
 syscall
 
 ch2: bge $t1, $t2, greater
 move $t3, $t1
 move $t1, $t2
 move $t2, $t3
 
 greater: la $a0, str3
 li $v0, 4
 syscall
 
 add $a0, $zero, $t1
 li $v0,1
 syscall
 
 la $a0, str4
 li $v0, 4
 syscall
 
 add $a0, $zero, $t2
 li $v0,1
 syscall
 
 end: jr $ra