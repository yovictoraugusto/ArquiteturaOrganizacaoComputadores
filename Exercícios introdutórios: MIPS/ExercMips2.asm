.text

.globl main
main:
	li $v0, 5
	syscall
	move $t0, $v0

	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	blt $t0, $t1, caso1
	blt $t1, $t0, caso2
	j caso3
	
	caso1:
		blt $t1, $t2, caso11 
		add $t4, $t0, $t2	# caso12
		j imprime
		
		caso11:
			add $t4,$t0,$t1
			j imprime
	
	caso2:
		blt $t0,$t2, caso21
		add $t4, $t1, $t2
		j imprime
		
		caso21:
			add $t4,$t1,$t0
			j imprime
			
	caso3:
		blt $t0, $t1, caso31
		add $t4, $t2, $t1
		j imprime
		
		caso31:
			add $t4,$t2,$t1
			j imprime
	
	imprime:
		li $v0, 1
		move $a0, $t4
		syscall
			
	
	li $v0, 10
	syscall

.data