.text
.globl main

main:
	li $t3, 2
	li $t4, 4
	li $t5, 8

		Divider:
			li $t7, 2
			mult $t3, $t7
			mflo $t6
			beq $t6, $t4, And
			j Exit
		
		And:
			li $t7, 2
			mult $t4, $t7
			mflo $t6
			beq $t6, $t5, Print
			j Exit
			
		Print:
			la $a0, msg
			li $v0, 4
			syscall
		
	Exit:
		li $v0, 10
		syscall

.data
enter:	.asciiz "\n"
msg:	.asciiz "Sao potencias de 2"