.text
.globl main

main:
	move $t0, $zero		# indice do array
	move $t1, $zero	# valor a ser colocado no array
	li $t2, 16 # tamanho do array
	
	loop:
		beq $t0, $t2, saiDoLoop
		sw $t1, myArray($t0)
		addi $t0, $t0, 4
		addi $t1, $t1, 1
		j loop
		
	saiDoLoop:
		move $t0, $zero
		imprime:
			beq $t0, $t2, saiDaImpressao
			li $v0, 1
			lw $a0, myArray($t0)
			syscall
			
			addi $t0, $t0, 4
			j imprime
		
		saiDaImpressao:
			li $v0, 10
			syscall

.data
	myArray:
		.align 2		# alinha palavra na posicao correta
		.space 16	# array de 4 inteiros ( 1 inteiro 1 bit)	
