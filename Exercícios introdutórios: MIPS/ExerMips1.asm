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
	
	bgt $t0, $zero, if #$t0 Maior
	j else
	
	if:
		add $t0, $t0, $t0
		li $v0, 4
        	la $a0, msg
        	syscall
        	
        	li $v0, 1
    		move $a0, $t0
		syscall
		j fim
		
	else:
		li $v0, 4
        	la $a0, msg1
        	syscall
	
	fim:
		li $v0, 10
		syscall  # terminate
	
	.data
msg:	.asciiz	"Número maior que 0.\nDobro: "
msg1:	.asciiz	"Número menor que 0.\n"