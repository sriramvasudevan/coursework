	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 108
	sw $ra, -4($fp)
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
	jalr Create_simpleLookup
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
	move $s0 $v0
	move $s1 $s0
	move $s2 $s1
	lw $s3 0($s2)
	move $s4 $s3
	lw $s5 0($s4)
	li $s6 2
	li $s7 4
	move $t0 $s1
	move $t1 $s6
	move $t2 $s7
	move $a0 $t0
	move $a1 $t1
	move $a2 $t2
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
	move $t3 $v0
	move $t4 $t3
	move $a0 $t4
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 108
	j $ra

	.text
	.globl Create_simpleLookup
Create_simpleLookup:
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
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t5 $v0
	move $t6 $t5
	move $t7 $t6
	la $t8 simpleLookup_look
	sw $t8, 0($t7)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t9 $v0
	move $s0 $t9
	move $s2 $s0
	move $s3 $t6
	sw $s3, 0($s2)
	move $v0 $s0
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
	move $s6 $a1
	move $s4 $a2
	move $s1 $s4
	li $s7 1
	add $v0, $s7, $s1
	move $s5 $v0
	li $t0 4
	mul $v0, $t0, $s5
	move $t1 $v0
	move $a0 $t1
	jal _halloc
	move $v0 $v0
	move $t2 $v0
	move $t3 $t2
	move $t4 $t3
	move $t5 $s1
	sw $t5, 0($t4)
	li $t7 0
L2:
	move $t8 $t7
	slt $v0, $t8, $s1
	move $t9 $v0
	move $t6 $t9
	beqz $t6 L3
	li $s2 1
	add $v0, $s2, $t7
	move $s3 $v0
	move $s0 $s3
	li $s4 4
	mul $v0, $s4, $s0
	move $s7 $v0
	move $s5 $s7
	move $t0 $t3
	add $v0, $t0, $s5
	move $t1 $v0
	move $t2 $t1
	move $t4 $t2
	li $t5 0
	sw $t5, 0($t4)
	move $t8 $t7
	add $v0, $t8, 1
	move $t9 $v0
	move $t7 $t9
	b L2
L3:
	nop
	move $t6 $t3
	move $s2 $t6
	li $s3 1
	add $v0, $s3, $s6
	move $s0 $v0
	move $s4 $s0
	li $s7 6
	li $s5 4
	mul $v0, $s5, $s4
	move $t0 $v0
	move $t1 $t0
	move $t2 $s2
	add $v0, $t2, $t1
	move $t4 $v0
	move $t5 $t4
	move $t8 $t5
	move $t9 $s7
	sw $t9, 0($t8)
	move $s1 $s2
	li $t7 1
	add $v0, $t7, $s6
	move $t3 $v0
	move $t6 $t3
	li $s3 4
	mul $v0, $s3, $t6
	move $s0 $v0
	move $s4 $s0
	move $s5 $s1
	add $v0, $s5, $s4
	move $t0 $v0
	move $t1 $t0
	move $t2 $t1
	lw $t4 0($t2)
	move $t5 $t4
	move $s7 $t5
	move $t8 $s7
	move $v0 $t8
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
