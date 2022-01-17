.data
msg: .asciiz "Georgia Konstantiou 02057\nThe results of the lab are:"
.text
main:
li $v0, 4
la $a0, msg
syscall

li $v0, 10
syscall