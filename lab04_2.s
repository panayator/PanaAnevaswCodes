 .data
textlow: .asciiz "This is a sample text!"
eol: .asciiz "\n"
 .text
.globl main
main: li $t0, 22 # set the string length
li $t1, 0 # set character counter to 0
la $t2, textlow # set string start address
move $a0, $t2 # print initial string
li $v0, 4
syscall
loop: lb $t3, 0($t2) # read current chracter
blt $t3, 97, next # if less than 'a' then ignore
bgt $t3, 122, next # if greater than 'z' then ignore
sub $t3, $t3, 32 # subtract 32 to turn to capital letter
sb $t3, 0($t2) # store new character back
next: addiu $t1, $t1, 1 # increase by 1 the character counter
addiu $t2, $t2, 1 # increase by 1 to advance to next character
bne $t0, $t1, loop # check if string length has not reached and back to loop
end: la $a0, eol # advance to next line
li $v0, 4
syscall
la $a0, textlow # print new string as resulted
li $v0, 4
syscall
jr $ra