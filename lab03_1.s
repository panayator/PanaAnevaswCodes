.data
str: .asciiz "The 10 number series is: \n"
spa: .byte 32
 .text
.globl main
main: li $t1, 11
li $t0, 1
la $a0, str
li $v0, 4
syscall
loop: move $a0, $t0
li $v0, 1
syscall
la $a0, spa
li $v0, 4
syscall
addiu $t0, $t0, 1
blt $t0, $t1, loop
jr $ra
# alternate exit
exit:
li $v0, 10
syscall