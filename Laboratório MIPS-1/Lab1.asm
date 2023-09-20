# Simple input/output in MIIPS assembly
# From: http://labs.cs.upt.ro/labs/so2/html/resources/nachos-doc/mipsf.html

	# Start .text segment (program code)
	.text
	
	.globl	main
main:
	# Get input A from user and save
	li	$v0,5		# read_int syscall code = 5
	syscall	
	move	$t0,$v0		# syscall results returned in $v0

	# Get input B from user and save
	li	$v0,5		# read_int syscall code = 5
	syscall	
	move	$t1,$v0		# syscall results returned in $v0
	
	# Get input C from user and save
	li	$v0,5		# read_int syscall code = 5
	syscall	
	move	$t2,$v0		# syscall results returned in $v0
	
	#comparassions
    bgt $t0, $t1, If #$t0 Maior
    bgt $t1, $t2, ElseIf #$t1 Maior
    j Else
	
If:
	bgt $t0, $t1, Imprime #$t0 Maior
	
ElseIf:
    # Print $t1
	li	$v0, 4
	la	$a0, msg3
	syscall
	
    li $v0, 1
    move $a0, $t1
    syscall

    j Fim
	
Else:
    # Print $t2
	li	$v0, 4
	la	$a0, msg3
	syscall
	
    li $v0, 1
    move $a0, $t2
    syscall

    j Fim
    
Imprime:
    # Print $t0
	li	$v0, 4
	la	$a0, msg3
	syscall
	
    li $v0, 1
    move $a0, $t0
    syscall

    j Fim

Fim:
	li	$v0,10		# exit
	syscall

	# Start .data segment (data!)
	.data
msg3:	.asciiz	"Maior: "