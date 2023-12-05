.text
.globl main
main:
	li $v0, 5
	syscall
	move $s7, $v0
	# CTEs de verificao (2<=k<=100)
	li $s0, 2
	li $s1, 100
	# Verificao
	blt $s7, $s0, exit	# limite inferior
	bgt $s7, $s1, exit	# limite superior
	# Entrada da string, ja limitada ao limite superior
	li $t6, 0 # cont entrada string
	entradaString:
		li $v0, 8
		la $a0, buffer
		li $a1, 21 # O tamanho e 101, pois tem que ter um ultimo caracter para o terminador de string
		syscall
	verificaString:
		la $a0, buffer
		li $t2, 0
		contaTamanho:
			lb $t3, 0($a0)
			beq $t3, $zero, endVerificaString # Verifica se chegou ao final da string
			addi $a0, $a0, 1
			addi $t2, $t2, 1
			j contaTamanho
		endVerificaString:
			# CTE de verificacao do limite inferior de string
			li $s0, 1
			# verificao
			ble $t2, $s0, exit
	caseSensitiveTest:
		la $a0, buffer
		jal verificaCaseSensitive
	testeValida:
		la $a0, buffer
		la $a1, languages
		jal validaString
		beq $v1, $zero, exit
		
	#############################
	# Segunda
	li $s6, 1
	entradaString1:
		addi $s6, $s6, 1
		li $v0, 8
		la $a0, buffer1
		li $a1, 21 # O tamanho e 101, pois tem que ter um ultimo caracter para o terminador de string
		syscall
	verificaString1:
		la $a0, buffer1
		li $t2, 0
		contaTamanho1:
			lb $t3, 0($a0)
			beq $t3, $zero, endVerificaString1 # Verifica se chegou ao final da string
			addi $a0, $a0, 1
			addi $t2, $t2, 1
			j contaTamanho1
		endVerificaString1:
			# CTE de verificacao do limite inferior de string
			li $s0, 1
			# verificao
			ble $t2, $s0, exit
	caseSensitiveTest1:
		la $a0, buffer1
		jal verificaCaseSensitive
		
	#############################
	blt $s6, $s7, entradaString1
	la $a1, buffer
	la $a0, buffer1
	jal comparaString
	li $v0, 4
    	la $a0, msg
   	syscall
	li $v0, 4
   	la $a0, buffer
   	syscall
	j exit
		
	# Funcao para case sensitive
	verificaCaseSensitive:
		caseSensitive:
			lb $t3, 0($a0)
			li $s3, 10
			beq $t3, $s3, fimString # Verifica se chegou ao final da string
			li $s2, 97 # a
			# verificao
			blt $t3, $s2, exit
			addi $a0, $a0, 1
			j caseSensitive
		fimString:
			jr $ra
				
	# Funcao compara string
	comparaString:
		compara:
			lb $t3, 0($a0)
			lb $t4, 0($a1)
			li $s3, 10
			beq $t3, $s3, teste2 # Verifica se chegou ao final da string
			teste2:
				beq $t4, $s3, fimComparacao # Verifica se chegou ao final da string
			bne $t3, $t4, ingles
			addi $a0, $a0, 1
			addi $a1, $a1, 1
			j compara
		ingles:
			li $v0, 4
			la $a0, msg
			syscall
			li $v0, 4
			la $a0, inglesMsg
			syscall
			j exit
		fimComparacao:
			jr $ra
			
	# Funcao valida string de entrada
	validaString:
		li $v1, 0
		move $t4, $zero	#indice
		li $t5, 5	#tamanho array
		vvalida:
			beq $t4, $t5, exitFunction	# fim do vetor
			la $t7, 0($a0)	# palavra a ser validada
			la $t8, languages($t4)
			add $t8, $t8, $t4
			loop:
				lb $t3, 0($t7)	# caracter da string de entrada
				lb $t6, 0($t8)	# caracter do vetor
				beqz $t6, nextBeqz
				j nextCommand
				nextBeqz:
					li $t9, 10
					beq $t3, $t9, match
				nextCommand:
				bne $t3, $t6, next
				addi $t7, $t7, 1
				addi $t8, $t8, 1
				j loop
			match:
				li $v1, 1
				j exitFunction
			next:
				addi $t8, $t8, 1
				lb $t6, 0($t8)
				beqz $t6, proximo
				j next
				proximo:
					addi $t8, $t8, 1
					j loop
		exitFunction:
			jr $ra
			
	exit:
		li $v0, 10
		syscall

.data
	inglesMsg: .asciiz "ingles"
	msg:    .asciiz "idioma:"
	buffer:	.space 21
	buffer1: .space 21
	languages:
		.asciiz "ingles"
		.asciiz "portugues"
		.asciiz "chines"
		.asciiz "espanhol"
		.asciiz "frances"
