# A demonstration of some simple MIPS instructions
# used to test QtSPIM

	# Declare main as a global function
	.globl main 

	# All program code is placed after the
	# .text assembler directive
	.text 
	
main:
    li $v0, 5
    syscall
    move $t0, $v0
    
    li $t1, 6
    li $t2, 99
    
    bgt $t0, $t2, Invalido
    blt $t0, $t1, Invalido
    li $t1, 1
    li $t2, 2
    j Teste
    
    Invalido: 
        li	$v0, 4
	    la	$a0, msgInvalido
	    syscall
        j Exit

    Teste:
        addi $t1, $t1, 1
        bgt $t1, $t0, Exit
        div $t1, $t2
        mfhi $t3
        ble $t3, $zero, Imprime
        j Teste
        
    Imprime:
        li $v0, 1
        move $a0, $t1
        syscall
        
        li $v0, 4
        la $a0, msgPar
        syscall
        
        mult $t1, $t1
        mflo $t4
        li $v0, 1
        move $a0, $t4
        syscall
        
        li $v0,4
        la $a0, msgPula
        syscall
        
        j Teste

    Exit:
        li $v0, 10
        syscall

    .data
msgInvalido: .asciiz "Valor invalido."
msgPar: .asciiz "^2 = "
msgPula: .asciiz "\n"

