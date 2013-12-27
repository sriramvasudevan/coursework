	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 104
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
	jalr Create_C23
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
	lw $s5 4($s4)
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
	jalr Create_B23
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
	move $s6 $v0
	move $s7 $s6
	move $t0 $s1
	move $t1 $s7
	move $a0 $t0
	move $a1 $t1
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
	move $t2 $v0
	move $t3 $t2
	move $a0 $t3
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 104
	j $ra

	.text
	.globl Create_A23
Create_A23:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 504
	sw $ra, -4($fp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	li $a0 12
	jal _halloc
	move $v0 $v0
	move $t4 $v0
	move $t5 $t4
	move $t6 $t5
	la $t7 A23_setI1
	sw $t7, 0($t6)
	move $t8 $t5
	la $t9 A23_init
	sw $t9, 4($t8)
	move $s0 $t5
	la $s2 A23_getI1
	sw $s2, 8($s0)
	li $a0 16
	jal _halloc
	move $v0 $v0
	move $s3 $v0
	move $s4 $s3
	move $s6 $s4
	move $s1 $t5
	sw $s1, 0($s6)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s7 $v0
	move $s5 $s7
	li $s5 0
	move $t0 $s4
	move $t1 $s5
	sw $t1, 4($t0)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t2 $v0
	move $t3 $t2
	li $t3 0
	move $t4 $s4
	move $t6 $t3
	sw $t6, 8($t4)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t7 $v0
	move $t8 $t7
	li $t8 0
	move $t9 $s4
	move $s0 $t8
	sw $s0, 12($t9)
	move $v0 $s4
	lw $s7, 28($sp)
	lw $s6, 24($sp)
	lw $s5, 20($sp)
	lw $s4, 16($sp)
	lw $s3, 12($sp)
	lw $s2, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 496($sp)
	addu $sp, $sp, 504
	j $ra

	.text
	.globl A23_init
A23_init:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 508
	sw $ra, -4($fp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	move $s2 $a0
	move $t5 $a1
	move $s3 $t5
	move $s6 $s3
	lw $s1 0($s6)
	move $s7 $s1
	lw $s5 8($s7)
	move $t0 $s3
	move $a0 $t0
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
	jalr $s5
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
	move $t1 $v0
	move $t2 $t1
	move $t3 $s2
	move $t4 $t2
	sw $t4, 8($t3)
	li $t6 222
	move $t7 $s2
	move $t8 $t6
	sw $t8, 4($t7)
	move $t9 $s2
	move $s0 $t9
	lw $s4 0($s0)
	move $t5 $s4
	lw $s6 0($t5)
	move $s1 $s2
	lw $s7 8($s1)
	move $s3 $s2
	lw $s5 4($s3)
	move $t0 $s7
	add $v0, $t0, $s5
	move $t1 $v0
	move $t2 $t1
	move $t3 $t9
	move $t4 $t2
	move $a0 $t3
	move $a1 $t4
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
	jalr $s6
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
	move $t6 $v0
	move $t7 $t6
	move $t8 $s2
	move $s0 $t7
	sw $s0, 12($t8)
	move $s4 $s2
	lw $t5 12($s4)
	move $s1 $t5
	move $v0 $s1
	lw $s7, 28($sp)
	lw $s6, 24($sp)
	lw $s5, 20($sp)
	lw $s4, 16($sp)
	lw $s3, 12($sp)
	lw $s2, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 500($sp)
	addu $sp, $sp, 508
	j $ra

	.text
	.globl A23_getI1
A23_getI1:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 504
	sw $ra, -4($fp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	move $s3 $a0
	move $s7 $s3
	lw $s5 12($s7)
	move $t0 $s5
	move $v0 $t0
	lw $s7, 28($sp)
	lw $s6, 24($sp)
	lw $s5, 20($sp)
	lw $s4, 16($sp)
	lw $s3, 12($sp)
	lw $s2, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 496($sp)
	addu $sp, $sp, 504
	j $ra

	.text
	.globl A23_setI1
A23_setI1:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 504
	sw $ra, -4($fp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	move $t9 $a1
	move $t1 $t9
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
	lw $fp, 496($sp)
	addu $sp, $sp, 504
	j $ra

	.text
	.globl Create_B23
Create_B23:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 504
	sw $ra, -4($fp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	li $a0 12
	jal _halloc
	move $v0 $v0
	move $t2 $v0
	move $s6 $t2
	move $t3 $s6
	la $t4 B23_setI1
	sw $t4, 0($t3)
	move $t6 $s6
	la $t7 B23_init
	sw $t7, 4($t6)
	move $t8 $s6
	la $s0 B23_getI1
	sw $s0, 8($t8)
	li $a0 20
	jal _halloc
	move $v0 $v0
	move $s2 $v0
	move $s4 $s2
	move $t5 $s4
	move $s1 $s6
	sw $s1, 0($t5)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s3 $v0
	move $s7 $s3
	li $s7 0
	move $s5 $s4
	move $t0 $s7
	sw $t0, 4($s5)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t9 $v0
	move $t1 $t9
	li $t1 0
	move $t2 $s4
	move $t3 $t1
	sw $t3, 8($t2)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t4 $v0
	move $t6 $t4
	li $t6 0
	move $t7 $s4
	move $t8 $t6
	sw $t8, 12($t7)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s0 $v0
	move $s2 $s0
	li $s2 0
	move $s6 $s4
	move $t5 $s2
	sw $t5, 16($s6)
	move $v0 $s4
	lw $s7, 28($sp)
	lw $s6, 24($sp)
	lw $s5, 20($sp)
	lw $s4, 16($sp)
	lw $s3, 12($sp)
	lw $s2, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 496($sp)
	addu $sp, $sp, 504
	j $ra

	.text
	.globl B23_init
B23_init:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 508
	sw $ra, -4($fp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	move $s7 $a0
	move $s3 $a1
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
	jalr Create_A23
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
	move $s1 $v0
	move $s5 $s1
	move $t0 $s5
	move $t9 $s3
	move $t1 $t9
	lw $t2 0($t1)
	move $t3 $t2
	lw $t4 8($t3)
	move $t6 $t9
	move $a0 $t6
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
	jalr $t4
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
	move $t7 $v0
	move $t8 $t7
	move $s0 $s7
	move $s2 $t8
	sw $s2, 4($s0)
	move $s6 $s7
	move $t5 $s6
	lw $s4 0($t5)
	move $s1 $s4
	lw $s5 0($s1)
	move $s3 $s7
	lw $t1 4($s3)
	move $t2 $t1
	move $t3 $s6
	move $t9 $t2
	move $a0 $t3
	move $a1 $t9
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
	jalr $s5
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
	move $t4 $v0
	move $t6 $t4
	move $t7 $s7
	move $t8 $t6
	sw $t8, 16($t7)
	move $s0 $t0
	move $s2 $s0
	lw $t5 0($s2)
	move $s4 $t5
	lw $s1 4($s4)
	move $s3 $s7
	move $t1 $s0
	move $s6 $s3
	move $a0 $t1
	move $a1 $s6
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
	jalr $s1
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
	move $t2 $v0
	move $s5 $t2
	move $v0 $s5
	lw $s7, 28($sp)
	lw $s6, 24($sp)
	lw $s5, 20($sp)
	lw $s4, 16($sp)
	lw $s3, 12($sp)
	lw $s2, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 500($sp)
	addu $sp, $sp, 508
	j $ra

	.text
	.globl B23_getI1
B23_getI1:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 504
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
	move $t3 $t9
	lw $t4 16($t3)
	move $t6 $t4
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
	lw $fp, 496($sp)
	addu $sp, $sp, 504
	j $ra

	.text
	.globl B23_setI1
B23_setI1:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 504
	sw $ra, -4($fp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	move $t8 $a1
	move $t7 $t8
	add $v0, $t7, 111
	move $t0 $v0
	move $s2 $t0
	move $v0 $s2
	lw $s7, 28($sp)
	lw $s6, 24($sp)
	lw $s5, 20($sp)
	lw $s4, 16($sp)
	lw $s3, 12($sp)
	lw $s2, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 496($sp)
	addu $sp, $sp, 504
	j $ra

	.text
	.globl Create_C23
Create_C23:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 504
	sw $ra, -4($fp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	li $a0 12
	jal _halloc
	move $v0 $v0
	move $t5 $v0
	move $s4 $t5
	move $s7 $s4
	la $s0 C23_setI1
	sw $s0, 0($s7)
	move $s3 $s4
	la $s1 C23_init
	sw $s1, 4($s3)
	move $t1 $s4
	la $s6 C23_getI1
	sw $s6, 8($t1)
	li $a0 24
	jal _halloc
	move $v0 $v0
	move $t2 $v0
	move $s5 $t2
	move $t9 $s5
	move $t3 $s4
	sw $t3, 0($t9)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t4 $v0
	move $t6 $t4
	li $t6 0
	move $t8 $s5
	move $t7 $t6
	sw $t7, 4($t8)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t0 $v0
	move $s2 $t0
	li $s2 0
	move $t5 $s5
	move $s7 $s2
	sw $s7, 8($t5)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s0 $v0
	move $s3 $s0
	li $s3 0
	move $s1 $s5
	move $t1 $s3
	sw $t1, 12($s1)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s6 $v0
	move $t2 $s6
	li $t2 0
	move $s4 $s5
	move $t9 $t2
	sw $t9, 16($s4)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t3 $v0
	move $t4 $t3
	li $t4 0
	move $t6 $s5
	move $t8 $t4
	sw $t8, 20($t6)
	move $v0 $s5
	lw $s7, 28($sp)
	lw $s6, 24($sp)
	lw $s5, 20($sp)
	lw $s4, 16($sp)
	lw $s3, 12($sp)
	lw $s2, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 496($sp)
	addu $sp, $sp, 504
	j $ra

	.text
	.globl C23_init
C23_init:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 508
	sw $ra, -4($fp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	move $s2 $a0
	move $t0 $a1
	li $t7 333
	move $t5 $s2
	move $s7 $t7
	sw $s7, 4($t5)
	move $s0 $s2
	move $s3 $s0
	lw $s1 0($s3)
	move $t1 $s1
	lw $s6 0($t1)
	move $t2 $s2
	lw $s4 4($t2)
	move $t9 $s4
	move $t3 $s0
	move $t4 $t9
	move $a0 $t3
	move $a1 $t4
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
	jalr $s6
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
	move $t6 $v0
	move $t8 $t6
	move $s5 $s2
	move $t7 $t8
	sw $t7, 20($s5)
	move $t5 $t0
	move $s7 $t5
	lw $s3 0($s7)
	move $s1 $s3
	lw $t1 4($s1)
	move $t2 $s2
	move $s4 $t5
	move $s0 $t2
	move $a0 $s4
	move $a1 $s0
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
	jalr $t1
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
	move $t9 $v0
	move $s6 $t9
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
	lw $fp, 500($sp)
	addu $sp, $sp, 508
	j $ra

	.text
	.globl C23_getI1
C23_getI1:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 504
	sw $ra, -4($fp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	move $t3 $a0
	move $t4 $t3
	lw $t6 20($t4)
	move $t8 $t6
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
	lw $fp, 496($sp)
	addu $sp, $sp, 504
	j $ra

	.text
	.globl C23_setI1
C23_setI1:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 504
	sw $ra, -4($fp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	move $t7 $a1
	move $s5 $t7
	mul $v0, $s5, 2
	move $t0 $v0
	move $s7 $t0
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
	lw $fp, 496($sp)
	addu $sp, $sp, 504
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
