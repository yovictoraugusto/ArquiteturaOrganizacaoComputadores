.text
.globl main

main:
	# inicia variavel
	move $t0, $zero	# indice do vetor
	move $t1, $zero	# indice de linha
	move $t2, $zero # indice da coluna
	li $t3, 400 # tamanho do vetor
	li $t4, 10 # tamanho da linha
	move $t5, $zero
	
	linha:
		beq $t1, $t4, coluna
		sw $t5, myArray($t0)
		addi $t0, $t0, 4
		addi $t1, $t1, 1
		addi $t5, $t5, 1
		j linha
	
	coluna:
		beq $t2, $t4, imprime
		addi $t2, $t2, 1
		move $t1, $zero
		j linha
		
	imprime:
		move $t0, $zero
		move $t1, $zero
		move $t2, $zero
		imprimeLinha:
			beq $t1, $t4, imprimeColuna
			li $v0, 1
			lw $a0, myArray($t0)
			syscall
				
			li $v0, 4
			la $a0, espaco
			syscall
				
			addi $t0, $t0, 4
			addi $t1, $t1, 1
			j imprimeLinha
				
		imprimeColuna:
			addi $t2, $t2, 1
			beq $t2, $t4, encerra
			move $t1, $zero
			
			li $v0, 4
			la $a0, pulaLinha
			syscall
			
			j imprimeLinha
		
	encerra:
		li $v0, 10
		syscall
	

.data
	pulaLinha:      .asciiz "\n"
	espaco: 	.asciiz " | "

	myArray:
		.align 2		# alinha palavra na posicao correta
		.space 400	# array de 4 inteiros ( 1 inteiro 1 bit)	
		
	