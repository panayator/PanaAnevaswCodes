 .data
atable: .byte 0, 0, 0, 0
btable: .byte 10, 252, 251, 10
ctable: .byte 10, 5, 6, 1
 .text
.globl main
main:
add $t4, $zero, $zero # i is initialized to 0, $t4 = 0
la $t0, atable
la $t1, btable
la $t2, ctable
Loop:
add $t5, $t4, $t1 # $t5 = address of b[i]
lb $t6, 0($t5) # $t6 = b[i]
add $t5, $t4, $t2 # $t5 = address of c[i]
lb $t7, 0($t5) # $t7 = c[i]
add $t6, $t6, $t7 # $t6 = b[i] + c[i]
add $t5, $t4, $t0 # $t5 = address of a[i]
sb $t6, 0($t5) # a[i] = b[i] + c[i]
addi $t4, $t4, 1 # i = i + 1
slti $t5, $t4, 4 # $t5 = 1 if $t4 < 5, i.e. i < 2
bne $t5, $zero, Loop # go to Loop if i < 5
jr $ra
# alternate exit
exit:
li $v0, 10
syscall