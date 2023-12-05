.text
.globl main

main:
	# seed
	li $v0, 30
	syscall
	move $t0, $a0

	li $a0, 1
	move $a1, $t0
	li $v0, 40
	syscall
	
	li $t1, 4
	li $t2,0
	# 
	li $t3, 1
	li $t4, 2
	li $t5, 3
	
	Loop:
		li $a0, 1
		li $a1, 100
		li $v0, 42
		syscall
		# condition loop
		addi $t2, $t2, 1
		beq $t2, $t1, Exit
		# print integer
		li $v0, 1
		syscall
		beq $t2, $t3, First
		beq $t2, $t4, Second
		beq $t2, $t5, Third 
		j Test

	Enter:
		# print enter
		la $a0, enter
		li $v0, 4
		syscall
		j Loop
	First:
		move $t3, $a0
		j Enter
	Second:
		move $t4, $a0
		j Enter
	Third:
		move $t5, $a0
		j Enter	
		
	Test:
		Sorting:
			ble $t4, $t3, Less1
			ble $t5, $t4, Less2
			j Divider
			
		Less1:
			move $t6, $t4
			move $t4, $t3
			move $t3, $t6
			j Sorting
			
		Less2:
			move $t6, $t5
			move $t5, $t4
			move $t4, $t6
			j Sorting
		
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