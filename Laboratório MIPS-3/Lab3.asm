# Simple input/output in MIPS assembly
# From: http://labs.cs.upt.ro/labs/so2/html/resources/nachos-doc/mipsf.html

# Start .text segment (program code)
.text

.globl main
main:
	# Get input L from user and save
    	li $v0, 5       # read_int syscall code = 5
    	syscall
    	move $t0, $v0   # syscall results returned in $v0
    	
    	li $s0, 1	#intervalo menor
    	li $s1, 30	#intervalo maior
    	li $s2, 1	#intervalo menor velocidade
    	li $s3, 50	#intervalo maior velocidade
    	li $t2, 0	#Maior
    	li $s4, 1	#Cont Loop
    	li $s5,1
    	
    	#Confere Intervalo
    	bge $t0, $s0, TesteDois
    	j MensagemErroL
    	TesteDois:
    		ble $t0, $s1, Loop
    		j MensagemErroL
    	
    	
    	
    	Loop:
    		#Verifica Loop
    		bgt $s4, $t0, Imprime
    	
    		# Entrada do Vi
    		li $v0, 5       # read_int syscall code = 5
    		syscall
    		move $t1, $v0   # syscall results returned in $v0
    		
    		add $s4, $s4, $s5
    		
    		bge $t1, $s2, TesteDoisVelocidade
    		j MensagemErroV
    		TesteDoisVelocidade:
    			ble $t1, $s3, Testa
    			j MensagemErroV
    	
    	
    	MensagemErroL:
    		li $v0, 1
    		move $a0, $t0
		syscall
		
		li $v0, 4
    		la $a0, msgErroL
    		syscall
    		j Fim
    		
    		
    	MensagemErroV:
    		li $v0, 1
    		move $a0, $t1
		syscall
		
		li $v0, 4
    		la $a0, msgErroV
    		syscall
    		j Loop
    	
    	
    	Testa:
    		ble $t1, $t2, Loop
    		move $t2, $t1
    		
    		j Loop
    		
    	Imprime:
    		li $t3, 10
    		blt $t2, $t3, NivelUm
    		li $t3, 20
    		bge $t2, $t3, NivelTres
    		
    		#Imprime Nivel Dois
    		li $t4, 2
    			
    		li $v0, 4
    		la $a0, msgNivel
    		syscall
    			
    		li $v0, 1
    		move $a0, $t4
    		syscall
    		j Fim
    		
    		NivelUm:
    			li $t4, 1
    			
    			li $v0, 4
    			la $a0, msgNivel
    			syscall
    			
    			li $v0, 1
    			move $a0, $t4
    			syscall
    			j Fim
    			
    		NivelTres:
    			li $t4, 3
    			
    			li $v0, 4
    			la $a0, msgNivel
    			syscall
    			
    			li $v0, 1
    			move $a0, $t4
    			syscall
    			j Fim
    	
    	
    	Fim:
    		# exit
		li $v0, 10     
		syscall
# Start .data segment (data!)
.data
	msgErroL: .asciiz ": valor invalido."
	msgErroV: .asciiz ": velocidade invalida\n"
	msgNivel: .asciiz "Maior nivel: velocidade "