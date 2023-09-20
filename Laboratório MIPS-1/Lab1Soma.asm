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
	
    add $t3,$t0,$t1     #a+b
    sub $t4, $t0, $t1  #a-b
    abs $t6, $t4
    add $t5, $t3, $t6  #a+b+(a-b)
    li $t6,2
    div $t7,$t5,$t6
    
    add $t3,$t7,$t2     #a+b
    sub $t4, $t7, $t2  #a-b
    abs $t6, $t4
    add $t5, $t3, $t6  #a+b+(a-b)
    li $t6,2
    div $t7,$t5,$t6

	li	$v0, 4
	la	$a0, msg3
	syscall
	
    li $v0, 1
    move $a0, $t7
    syscall

	li	$v0,10		# exit
	syscall

	# Start .data segment (data!)
	.data
msg3:	.asciiz	"Maior: "