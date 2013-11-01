	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 108
	sw $ra, -4($fp)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s0 $v0
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s1 $v0
	la $s2 simpleLookup_look
	sw $s2, 0($s0)
	sw $s0, 0($s1)
	move $s3 $s1
	lw $s4 0($s3)
	lw $s5 0($s4)
	li $s6 2
	li $s7 4
	move $a0 $s3
	move $a1 $s6
	move $a2 $s7
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $t5, 20($sp)
	sw $t6, 24($sp)
	sw $t7, 28($sp)
	sw $t8, 32($sp)
	sw $t9, 36($sp)
	jalr $s5
	lw $t9, 36($sp)
	lw $t8, 32($sp)
	lw $t7, 28($sp)
	lw $t6, 24($sp)
	lw $t5, 20($sp)
	lw $t4, 16($sp)
	lw $t3, 12($sp)
	lw $t2, 8($sp)
	lw $t1, 4($sp)
	lw $t0, 0($sp)
	move $t0 $v0
	move $a0 $t0
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 108
	j $ra

	.text
	.globl simpleLookup_look
simpleLookup_look:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 104
	sw $ra, -4($fp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	move $t2 $a1
	move $t1 $a2
	move $t3 $t1
	add $v0, $t3, 1
	move $t4 $v0
	mul $v0, $t4, 4
	move $t5 $v0
	move $a0 $t5
	jal _halloc
	move $v0 $v0
	move $t6 $v0
	move $t7 $t6
	li $t8 4
L1:
	nop
	add $v0, $t3, 1
	move $t9 $v0
	mul $v0, $t9, 4
	move $s2 $v0
	slt $v0, $t8, $s2
	move $s0 $v0
	beqz $s0 L2
	add $v0, $t7, $t8
	move $s1 $v0
	li $s4 0
	sw $s4, 0($s1)
	add $v0, $t8, 4
	move $s3 $v0
	move $t8 $s3
	b L1
L2:
	nop
	sw $t3, 0($t7)
	move $s5 $t7
	move $s6 $s5
	move $s7 $t2
	slt $v0, $s7, 0
	move $t0 $v0
	beqz $t0 L3
	li $v0, 4
	la $a0, str_er
	syscall
L3:
	nop
	lw $t1 0($s6)
	slt $v0, $s7, $t1
	move $t4 $v0
	li $t5 1
	sub $v0, $t5, $t4
	move $t6 $v0
	beqz $t6 L4
	li $v0, 4
	la $a0, str_er
	syscall
L4:
	nop
	li $t9 4
	mul $v0, $t9, $s7
	move $s2 $v0
	move $s7 $s2
	add $v0, $s7, 4
	move $s0 $v0
	add $v0, $s6, $s0
	move $s1 $v0
	li $s4 6
	sw $s4, 0($s1)
	move $s3 $s5
	move $t8 $t2
	slt $v0, $t8, 0
	move $t3 $v0
	beqz $t3 L5
	li $v0, 4
	la $a0, str_er
	syscall
L5:
	nop
	lw $t7 0($s3)
	slt $v0, $t8, $t7
	move $t0 $v0
	li $t1 1
	sub $v0, $t1, $t0
	move $t4 $v0
	beqz $t4 L6
	li $v0, 4
	la $a0, str_er
	syscall
L6:
	nop
	li $t5 4
	mul $v0, $t5, $t8
	move $t6 $v0
	move $t8 $t6
	add $v0, $t8, 4
	move $t9 $v0
	add $v0, $s3, $t9
	move $s2 $v0
	lw $s7 0($s2)
	move $s6 $s7
	move $v0 $s6
	lw $s7, 28($sp)
	lw $s6, 24($sp)
	lw $s5, 20($sp)
	lw $s4, 16($sp)
	lw $s3, 12($sp)
	lw $s2, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 96($sp)
	addu $sp, $sp, 104
	j $ra

	.text
	.globl _halloc
_halloc:
	li $v0, 9
	syscall
	j $ra

	.text
	.globl _print
_print:
	li $v0, 1
	syscall
	la $a0, newl
	li $v0, 4
	syscall
	j $ra

	.data
	.align   0
newl:   .asciiz "\n"
	.data
	.align   0
str_er: .asciiz " ERROR: abnormal termination\n"
