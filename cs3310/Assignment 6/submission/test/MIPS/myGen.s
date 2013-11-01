	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 100
	sw $ra, -4($fp)
	li $s0 10
	move $a0 $s0
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 100
	j $ra

	.text
	.globl Create_A
Create_A:
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
	move $s1 $v0
	move $s2 $s1
	move $s3 $s2
	la $s4 A_foo
	sw $s4, 0($s3)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s5 $v0
	move $s6 $s5
	move $s7 $s6
	move $t0 $s2
	sw $t0, 0($s7)
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
	.globl A_foo
A_foo:
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
	move $t1 $a0
	li $t2 9
	li $t3 1
	add $v0, $t3, $t2
	move $t4 $v0
	li $t5 4
	mul $v0, $t5, $t4
	move $t6 $v0
	move $a0 $t6
	jal _halloc
	move $v0 $v0
	move $t7 $v0
	move $t8 $t7
	move $t9 $t8
	move $s0 $t2
	sw $s0, 0($t9)
	li $s1 0
L1:
	move $s3 $s1
	slt $v0, $s3, $t2
	move $s4 $v0
	move $s5 $s4
	beqz $s5 L2
	li $s2 1
	add $v0, $s2, $s1
	move $s7 $v0
	move $t0 $s7
	li $s6 4
	mul $v0, $s6, $t0
	move $t3 $v0
	move $t4 $t3
	move $t5 $t8
	add $v0, $t5, $t4
	move $t6 $v0
	move $t7 $t6
	move $t9 $t7
	li $s0 0
	sw $s0, 0($t9)
	move $s3 $s1
	add $v0, $s3, 1
	move $s4 $v0
	move $s1 $s4
	b L1
L2:
	nop
	move $s5 $t8
	move $s2 $s5
	move $s7 $t1
	move $v0 $s7
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
	.globl Create_B
Create_B:
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
	move $t0 $v0
	move $s6 $t0
	move $t3 $s6
	la $t4 B_foo
	sw $t4, 0($t3)
	li $a0 12
	jal _halloc
	move $v0 $v0
	move $t5 $v0
	move $t6 $t5
	move $t7 $t6
	move $t9 $s6
	sw $t9, 0($t7)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s0 $v0
	move $s3 $s0
	li $s3 0
	move $s4 $t6
	move $t2 $s3
	sw $t2, 4($s4)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s1 $v0
	move $t8 $s1
	li $t8 0
	move $s5 $t6
	move $s2 $t8
	sw $s2, 8($s5)
	move $v0 $t6
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
	.globl B_foo
B_foo:
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
	move $t1 $a0
	move $s7 $t1
	lw $t0 8($s7)
	move $t3 $t0
	move $t4 $t3
	lw $t5 0($t4)
	move $s6 $t5
	lw $t7 0($s6)
	move $t9 $t3
	move $a0 $t9
	sw $t0, 32($sp)
	sw $t1, 36($sp)
	sw $t2, 40($sp)
	sw $t3, 44($sp)
	sw $t4, 48($sp)
	sw $t5, 52($sp)
	sw $t6, 56($sp)
	sw $t7, 60($sp)
	sw $t8, 64($sp)
	sw $t9, 68($sp)
	jalr $t7
	lw $t9, 68($sp)
	lw $t8, 64($sp)
	lw $t7, 60($sp)
	lw $t6, 56($sp)
	lw $t5, 52($sp)
	lw $t4, 48($sp)
	lw $t3, 44($sp)
	lw $t2, 40($sp)
	lw $t1, 36($sp)
	lw $t0, 32($sp)
	move $s0 $v0
	move $s3 $s0
	move $v0 $s3
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
	.globl Create_C
Create_C:
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
	li $a0 8
	jal _halloc
	move $v0 $v0
	move $s4 $v0
	move $t2 $s4
	move $s1 $t2
	la $t8 C_foo0
	sw $t8, 0($s1)
	move $s5 $t2
	la $s2 C_foo
	sw $s2, 4($s5)
	li $a0 8
	jal _halloc
	move $v0 $v0
	move $t6 $v0
	move $t1 $t6
	move $s7 $t1
	move $t0 $t2
	sw $t0, 0($s7)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t4 $v0
	move $t5 $t4
	li $t5 0
	move $s6 $t1
	move $t3 $t5
	sw $t3, 4($s6)
	move $v0 $t1
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
	.globl C_foo0
C_foo0:
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
	move $t9 $a0
	move $t7 $t9
	lw $s0 4($t7)
	move $s3 $s0
	move $v0 $s3
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
	.globl C_foo
C_foo:
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
	move $s1 $a0
	li $s4 9
	li $t8 1
	add $v0, $t8, $s4
	move $s5 $v0
	li $s2 4
	mul $v0, $s2, $s5
	move $t6 $v0
	move $a0 $t6
	jal _halloc
	move $v0 $v0
	move $t2 $v0
	move $s7 $t2
	move $t0 $s7
	move $t4 $s4
	sw $t4, 0($t0)
	li $t5 0
L6:
	move $s6 $t5
	slt $v0, $s6, $s4
	move $t3 $v0
	move $t1 $t3
	beqz $t1 L7
	li $t9 1
	add $v0, $t9, $t5
	move $t7 $v0
	move $s0 $t7
	li $s3 4
	mul $v0, $s3, $s0
	move $t8 $v0
	move $s5 $t8
	move $s2 $s7
	add $v0, $s2, $s5
	move $t6 $v0
	move $t2 $t6
	move $t0 $t2
	li $t4 0
	sw $t4, 0($t0)
	move $s6 $t5
	add $v0, $s6, 1
	move $t3 $v0
	move $t5 $t3
	b L6
L7:
	nop
	move $t1 $s7
	move $t9 $t1
	move $t7 $s1
	move $v0 $t7
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
