.eqv genID 1  # PRNG id
.data
seed:    .word 318075184075019
msgInicio:      .asciiz "Bem-vindo ao jogo de adivinhação!\nVocê terá 5 chances.\n"
msgPalpite:     .asciiz "\nDigite o seu palpite (1-10, 0 para desistir): "
msgDesistencia: .asciiz "\nVocê desistiu. O número secreto era: "
msgMaior:       .asciiz "\nTente um número menor.\n"
msgMenor:       .asciiz "\nTente um número maior.\n"
msgGanho:       .asciiz "\nParabéns, você acertou!.\n"
msgChance:       .asciiz "Quantidade de chances: "
msgFimChance:       .asciiz "Que pena, acabaram as chances ;(.\nO número secreto era: "

.text
.globl main

main:
	#Setando quantidade de chance
	li $v1, 5
	move $t3, $v1
	
	# Imprime a mensagem de boas-vindas
    	li $v0, 4
	la $a0, msgInicio
    	syscall
    	
    	#Gera numero aleatorio
    	li $a0, genID
	lw $a1, seed
	li $v0, 40
	syscall 
	li $v0, 42
	li $a1, 10  # upper bound (not includes this number)
	syscall  
	move $t0, $a0
	addi $t0,$t0, 1 # Limite inferios
	
	loop:
		# Teste Chance
		ble $t3, $zero, fimChance
		
		# Quantidade de chances
        	li $v0, 4
        	la $a0, msgChance
        	syscall
        	
        	li $v0, 1
    		move $a0, $t3
		syscall
		
		sub $t3, $t3, 1
		
		# Pede o palpite ao jogador
        	li $v0, 4
        	la $a0, msgPalpite
        	syscall
        	
        	# Lê o palpite do jogador
        	li $v0, 5
        	syscall
        	move $t2, $v0  # $t2 contém o palpite do jogador
        	
        	#caso de desistencia
        	ble $t2, $zero, desistencia
        	
        	# Teste Chance
		ble $t3, $zero, fimChance
        	
        	#caso maior
        	bgt $t2, $t0, maior
        	
        	#caso menor
        	blt $t2, $t0, menor
        	
        	#acerto
        	li $v0, 4
        	la $a0, msgGanho
        	syscall
        	j fim
        	
        maior:
        	li $v0, 4
        	la $a0, msgMaior
        	syscall
        	j loop
        	
        menor:
        	li $v0, 4
        	la $a0, msgMenor
        	syscall
        	j loop

	desistencia:
		li $v0, 4
        	la $a0, msgDesistencia
        	syscall
        	
        	li $v0, 1
    		move $a0, $t0
		syscall
		j fim
		
	fimChance:
		li $v0, 4
        	la $a0, msgFimChance
        	syscall
        	
        	li $v0, 1
    		move $a0, $t0
		syscall
		j fim
		
	fim:

		li $v0, 10
		syscall  # terminate