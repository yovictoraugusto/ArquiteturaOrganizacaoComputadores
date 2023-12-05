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
    
    
    # Get input F from user and save

    li $v0, 5       # read_int syscall code = 5

    syscall

    move $t5, $v0   # syscall results returned in $v0

    #Positivos e negativos

    li $t6, 0   # cont positivos
    li $t7,0    # para teste

    bgt $t0, $t7, Num_a_positive

loop2:
    bgt $t1, $t7, num_b_positive

loop3:
    bgt $t2, $t7, num_c_positive
    
loop4:
    bgt $t3, $t7, num_d_positive

loop5:
    bgt $t4, $t7, num_e_positive

loop6:
    bgt $t5, $t7, num_f_positive
    
loop7:
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

num_f_positive:
    addi $t6, $t6, 1
    j loop7

Fim:
    # Print "valores positivos"
    li $v0, 1
    move $a0, $t6
    syscall

    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 10     # exitz
    syscall

# Start .data segment (data!)
.data
msg: .asciiz " valores positivos"
