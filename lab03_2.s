 .data
str: .asciiz "Enter the number of Fibonacci numbers to be displayed (suggested 1-10): "
spa: .byte 32
 .text
.globl main
main: li $t0, 0
li $t1, 1
la $a0, str
li $v0, 4
syscall
li $v0, 5
syscall
move $t2, $v0
loop: move $a0, $t1
li $v0, 1
syscall
add $t3, $t0, $t1
move $t0, $t1
move $t1, $t3
la $a0, spa
li $v0, 4
syscall
sub $t2, $t2, 1
bne $t2, $zero, loop
jr $ra
# alternate exit
exit:
li $v0, 10
syscall