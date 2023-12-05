.text
.globl main

main:
	jal input
	continue:
		jal output
	continue2:
		j encerra
	li $t1, 40
	push $t1
	push 40
	
input:
	move $t0, $zero
	li $t1, 40
	li $v0, 4
	la $a0, msg
	syscall
	loop:
		beq $t0, $t1, saiFuncao
		li $v0, 5
		syscall
		move $t2, $v0
		sw $t2, myArray($t0)
		addi $t0, $t0, 4
		j loop
	saiFuncao:
		j continue
	
output:
	move $t0, $zero
	li $t1, 40
	imprime:
		li $v0, 1
		lw $a0, myArray($t0)
		syscall
		addi $t0, $t0, 4
		beq $t0, $t1, saiDaImpressao
		li $v0, 4
		la $a0, virgula
		syscall
		j imprime
	saiDaImpressao:
		j continue2
		

		
encerra:
	li $v0, 10
	syscall

.data
	msg: .asciiz "Digite 10 numeros separados por enter\n"
	virgula: .asciiz ", "
	myArray:
		.align 2		# alinha palavra na posicao correta
		.space 40		# array de 4 inteiros ( 1 inteiro 1 bit