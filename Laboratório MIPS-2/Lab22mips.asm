# Simple input/output in MIPS assembly
# From: http://labs.cs.upt.ro/labs/so2/html/resources/nachos-doc/mipsf.html

# Start .text segment (program code)
.text

.globl main
main:
    # Get input A from user and save
    li $v0, 5       # read_int syscall code = 5
    syscall
    move $t0, $v0   # syscall results returned in $v0

    # Get input B from user and save
    li $v0, 5       # read_int syscall code = 5
    syscall
    move $t1, $v0   # syscall results returned in $v0

    # Get input C from user and save
    li $v0, 5       # read_int syscall code = 5
    syscall
    move $t2, $v0   # syscall results returned in $v0

    # Get input D from user and save
    li $v0, 5       # read_int syscall code = 5
    syscall
    move $t3, $v0   # syscall results returned in $v0

    # Get input E from user and save
    li $v0, 5       # read_int syscall code = 5
    syscall
    move $t4, $v0   # syscall results returned in $v0

    li $t6, 0
    li $t8,0

    li $t7,2
    div $t0, $t7
    mfhi $t5

    ble $t5, $zero, Num_a_par
    addi $t8, $t8, 1
    
loop2par:
    div $t1, $t7
    mfhi $t5
    ble $t5, $zero, num_b_par
    addi $t8, $t8, 1
    
loop3par:
    div $t1, $t7
    mfhi $t5
    ble $t5, $zero, num_c_par
    addi $t8, $t8, 1
    
loop4par:
    div $t2, $t7
    mfhi $t5
    ble $t5, $zero, num_d_par
    addi $t8, $t8, 1
    
loop5par:
    div $t3, $t7
    mfhi $t5
    ble $t5, $zero, num_e_par
    addi $t8, $t8, 1
    
loop6par:
    j Fimpar

Num_a_par:
    addi $t6, $t6, 1
    j loop2par
num_b_par:
    addi $t6, $t6, 1
    j loop3par
num_c_par:
    addi $t6, $t6, 1
    j loop4par
num_d_par:
    addi $t6, $t6, 1
    j loop5par
num_e_par:
    addi $t6, $t6, 1
    j loop6par
    
Fimpar:    
    # Print "valores pares"
    li $v0, 1
    move $a0, $t8
    syscall

    li $v0, 4
    la $a0, msg3
    syscall
    
    # Print "valores impares"
    li $v0, 1
    move $a0, $t6
    syscall

    li $v0, 4
    la $a0, msg4
    syscall

    #Positivos e negativos

    li $t6, 0
    li $t7,0
    li $t8,0

    bgt $t0, $t7, Num_a_positive
    addi $t8, $t8, 1
    
loop2:
    bgt $t1, $t7, num_b_positive
    addi $t8, $t8, 1
    
loop3:
    bgt $t2, $t7, num_c_positive
    addi $t8, $t8, 1
    
loop4:
    bgt $t3, $t7, num_d_positive
    addi $t8, $t8, 1
    
loop5:
    bgt $t4, $t7, num_e_positive
    addi $t8, $t8, 1
    
loop6:
    j Fim

Num_a_positive:
    addi $t6, $t6, 1
    j loop2
num_b_positive:
    addi $t6, $t6, 1
    j loop3
num_c_positive:
    addi $t6, $t6, 1
    j loop4
num_d_positive:
    addi $t6, $t6, 1
    j loop5
num_e_positive:
    addi $t6, $t6, 1
    j loop6

Fim:
    # Print "valores positivos"
    li $v0, 1
    move $a0, $t6
    syscall

    li $v0, 4
    la $a0, msg
    syscall
    
    # Print "valores negativos"
    li $v0, 1
    move $a0, $t8
    syscall

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 10     # exit
    syscall

# Start .data segment (data!)
.data
msg3: .asciiz " valor(es) par(es)\n"
msg4: .asciiz " valor(es) impar(es)\n"
msg: .asciiz " valor(es) positivo(s)\n"
msg2: .asciiz " valor(es) negativo(s)"
