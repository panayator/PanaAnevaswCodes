 .data
test: .space 4
 .text
.globl main
main: li $t0, 0x11223344 # number to be converted supposed to be in $t0
la $t1, test
sw $t0, ($t1) # store to address pointed by label test
# start of conversion 
rol $t1, $t0, 8
li $t2, 0x00FF00FF # $t2 contains mask 0x00FF00FF
and $t3, $t1, $t2 # byte 0 and 2 valid
ror $t1, $t0, 8
not $t2, $t2 # $t2 contains mask 0xFF00FF00
and $t1, $t1, $t2 # byte 1 and 3 valid
or $t3, $t3, $t1 # little endian-number in $t3
la $t1, test
sw $t3, ($t1) # store to address pointed by label test
jr $ra