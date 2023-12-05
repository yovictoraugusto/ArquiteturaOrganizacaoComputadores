.text
.globl main

main:
	move $s0, $zero # indice array
	loop:
		li $t0, 60 # tamanho do vetor (4 * 15)
		beq $s0, $t0, exitLoop
		li $v0, 5
		syscall
		move $s1, $v0
		sw $s1, array($s0)
		addi $s0, $s0, 4
		j loop
	exitLoop:
		# jal printArray
		jal countingSort
		jal printArray2
		j exit
		
	printArray2:	
		move $s0, $zero
		print2:
			li $t0, 60
			beq $s0, $t0, exitPrint2
			li $v0, 1
			lw $a0, arraySort($s0)
			syscall
			li $v0, 4
			la $a0, linha
			syscall
			addi $s0, $s0, 4
			j print2
		exitPrint2:
			jr $ra

	countingSort:
		move $s0, $zero # i
		li $t0, 60 # n
		sort: # for i < n
			beq $t0, $s0, exitCounting
			move $s1, $zero # x
			move $s2, $zero # j
			loopSort: # for j < n
				beq $s2, $t0, exitLoopSort
				lw $t1, array($s0) # a[i]
				lw $t2, array($s2) # a[j]
				bgt $t1, $t2, contX
				j nopContX
				contX:
					addi $s1, $s1, 1 # x++
				nopContX:
					addi $s2, $s2, 4 # j++
					j loopSort
			exitLoopSort:
				lw $t3, array($s0) # a[i]
				li $t4, 4 
				move $t5, $s1
				mult $t5, $t4
				mflo $t5
				sw $t3, arraySort($t5) # b[x]
				addi $s0, $s0, 4 # i++
				j sort
		exitCounting:
			jr $ra
	
	exit:
		li $v0, 10
		syscall	
		

.data
linha: .asciiz "\n"
array:	# a
	.align 2
	.space 60
arraySort:	# b
	.align 2
	.space 60
