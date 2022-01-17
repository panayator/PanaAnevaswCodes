 .data
test: .space 4
 .text
.globl main
main: li $t0, 0x11223344 # number to be converted supposed to be in $t0
la $t1, test
sw $t0, ($t1) # store to address pointed by label test
# start of conversion 
mul $t1, $t0, 256
li $t2, 0x00FF0000 # $t2 contains mask 0x00FF0000
and $t3, $t1, $t2 # byte 2 valid
div $t1, $t0, 256
li $t2, 0x0000FF00 # $t2 contains mask 0x0000FF00
and $t1, $t1, $t2 # byte 1 valid
or $t3, $t3, $t1
mul $t1, $t0, 16777216
li $t2, 0xFF000000 # $t2 contains mask 0xFF000000
and $t1, $t1, $t2 # byte 3 valid
or $t3, $t3, $t1
div $t1, $t0, 16777216
li $t2, 0x000000FF # $t2 contains mask 0x000000FF
and $t1, $t1, $t2 # byte 0 valid
or $t3, $t3, $t1 # little endian-number in $t3
la $t1, test
sw $t3, ($t1) # store to address pointed by label test
jr $ra