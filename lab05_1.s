 .data
test: .space 4
 .text
.globl main
main: li $t0, 0x11223344 # number to be converted supposed to be in $t0
la $t1, test
sw $t0, ($t1) # store to address pointed by label test
# start of conversion
lb $t2, ($t1)
lb $t3, 3($t1)
sb $t3, ($t1)
sb $t2, 3($t1)
lb $t2, 1($t1)
lb $t3, 2($t1)
sb $t3, 1($t1)
sb $t2, 2($t1)
jr $ra