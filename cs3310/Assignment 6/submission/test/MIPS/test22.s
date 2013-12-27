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
	jalr Create_B25
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
	jalr Create_C25
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
	li $t0 1
	move $t1 $s1
	move $t2 $s7
	move $t3 $t0
	move $a0 $t1
	move $a1 $t2
	move $a2 $t3
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
	move $t4 $v0
	move $t5 $t4
	move $a0 $t5
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 108
	j $ra

	.text
	.globl Create_A25
Create_A25:
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
	li $a0 8
	jal _halloc
	move $v0 $v0
	move $t6 $v0
	move $t7 $t6
	move $t8 $t7
	la $t9 A25_init
	sw $t9, 0($t8)
	move $s0 $t7
	la $s2 A25_add
	sw $s2, 4($s0)
	li $a0 12
	jal _halloc
	move $v0 $v0
	move $s3 $v0
	move $s4 $s3
	move $s6 $s4
	move $s1 $t7
	sw $s1, 0($s6)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s7 $v0
	move $t0 $s7
	li $t0 0
	move $s5 $s4
	move $t1 $t0
	sw $t1, 4($s5)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t2 $v0
	move $t3 $t2
	li $t3 0
	move $t4 $s4
	move $t5 $t3
	sw $t5, 8($t4)
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
	.globl A25_add
A25_add:
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
	move $t9 $a0
	move $t6 $a2
	move $t8 $t9
	move $s0 $t8
	lw $s2 0($s0)
	move $s3 $s2
	lw $t7 0($s3)
	move $s6 $t6
	move $s1 $t8
	move $s7 $s6
	move $a0 $s1
	move $a1 $s7
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
	move $t0 $v0
	move $s5 $t0
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
	.globl A25_init
A25_init:
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
	move $t1 $a0
	move $t2 $a1
	move $t3 $t2
	slt $v0, $t3, 50
	move $t4 $v0
	move $t5 $t4
	beqz $t5 L4
	move $s4 $t2
	move $t9 $t1
	move $s0 $s4
	sw $s0, 4($t9)
	b L5
L4:
	nop
	li $s2 2
	mul $v0, $s2, $t2
	move $s3 $v0
	move $t6 $s3
	move $t8 $t1
	move $s6 $t6
	sw $s6, 4($t8)
L5:
	nop
	move $t7 $t1
	lw $s1 4($t7)
	move $s7 $s1
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
	.globl Create_B25
Create_B25:
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
	li $a0 8
	jal _halloc
	move $v0 $v0
	move $t0 $v0
	move $s5 $t0
	move $t3 $s5
	la $t4 B25_init
	sw $t4, 0($t3)
	move $t5 $s5
	la $s4 B25_add
	sw $s4, 4($t5)
	li $a0 16
	jal _halloc
	move $v0 $v0
	move $t9 $v0
	move $s0 $t9
	move $t2 $s0
	move $s2 $s5
	sw $s2, 0($t2)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s3 $v0
	move $t6 $s3
	li $t6 0
	move $t8 $s0
	move $s6 $t6
	sw $s6, 4($t8)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t1 $v0
	move $t7 $t1
	li $t7 0
	move $s1 $s0
	move $s7 $t7
	sw $s7, 8($s1)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t0 $v0
	move $t3 $t0
	li $t3 0
	move $t4 $s0
	move $t5 $t3
	sw $t5, 12($t4)
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
	lw $fp, 496($sp)
	addu $sp, $sp, 504
	j $ra

	.text
	.globl B25_add
B25_add:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 512
	sw $ra, -4($fp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	move $t2 $a0
	move $s5 $a1
	move $t9 $a2
	move $s4 $t2
	move $s2 $s4
	lw $s3 0($s2)
	move $t6 $s3
	lw $t8 0($t6)
	move $s6 $t9
	move $t1 $s4
	move $t7 $s6
	move $a0 $t1
	move $a1 $t7
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
	jalr $t8
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
	move $s7 $s1
	move $a0 $s7
	jal _print
	move $t0 $s5
	move $t3 $t0
	lw $t4 0($t3)
	move $t5 $t4
	lw $s0 4($t5)
	move $s2 $t2
	lw $s3 8($s2)
	move $t6 $s3
	move $t9 $t2
	lw $s4 12($t9)
	move $s6 $s4
	move $t8 $t0
	move $t1 $t6
	move $t7 $s6
	move $a0 $t8
	move $a1 $t1
	move $a2 $t7
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
	jalr $s0
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
	move $s7 $s1
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
	lw $fp, 504($sp)
	addu $sp, $sp, 512
	j $ra

	.text
	.globl B25_init
B25_init:
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
	move $t4 $a0
	move $t3 $a1
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
	jalr Create_B25
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
	move $s5 $v0
	move $t5 $s5
	move $s2 $t4
	move $s3 $t5
	sw $s3, 8($s2)
	li $t2 2
	mul $v0, $t2, $t3
	move $t9 $v0
	move $s4 $t9
	move $t0 $t4
	move $t6 $s4
	sw $t6, 4($t0)
	li $s6 10
	add $v0, $s6, $t3
	move $s0 $v0
	move $t8 $s0
	move $t1 $t4
	move $t7 $t8
	sw $t7, 12($t1)
	move $s1 $t4
	lw $s7 4($s1)
	move $s5 $t4
	lw $t5 12($s5)
	move $s2 $s7
	add $v0, $s2, $t5
	move $s3 $v0
	move $t2 $s3
	move $v0 $t2
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
	.globl Create_C25
Create_C25:
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
	li $a0 8
	jal _halloc
	move $v0 $v0
	move $t9 $v0
	move $s4 $t9
	move $t0 $s4
	la $t6 C25_init
	sw $t6, 0($t0)
	move $t3 $s4
	la $s6 C25_add
	sw $s6, 4($t3)
	li $a0 16
	jal _halloc
	move $v0 $v0
	move $s0 $v0
	move $t8 $s0
	move $t1 $t8
	move $t7 $s4
	sw $t7, 0($t1)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s1 $v0
	move $t4 $s1
	li $t4 0
	move $s5 $t8
	move $s7 $t4
	sw $s7, 4($s5)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t5 $v0
	move $s2 $t5
	li $s2 0
	move $s3 $t8
	move $t2 $s2
	sw $t2, 8($s3)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t9 $v0
	move $t0 $t9
	li $t0 0
	move $t6 $t8
	move $t3 $t0
	sw $t3, 12($t6)
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
	.globl C25_add
C25_add:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 512
	sw $ra, -4($fp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	move $s0 $a0
	move $s6 $a1
	move $s4 $a2
	move $t1 $s0
	move $t7 $t1
	lw $s1 0($t7)
	move $t4 $s1
	lw $s5 0($t4)
	move $s7 $s4
	move $t5 $t1
	move $s2 $s7
	move $a0 $t5
	move $a1 $s2
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
	move $s3 $v0
	move $t2 $s3
	move $a0 $t2
	jal _print
	move $t9 $s0
	lw $t0 12($t9)
	move $t6 $t0
	move $t3 $t6
	lw $t8 0($t3)
	move $t7 $t8
	lw $s1 4($t7)
	move $t4 $s6
	move $s4 $s0
	lw $t1 8($s4)
	move $s7 $t1
	move $s5 $t6
	move $t5 $t4
	move $s2 $s7
	move $a0 $s5
	move $a1 $t5
	move $a2 $s2
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
	move $s3 $v0
	move $t2 $s3
	move $v0 $t2
	lw $s7, 28($sp)
	lw $s6, 24($sp)
	lw $s5, 20($sp)
	lw $s4, 16($sp)
	lw $s3, 12($sp)
	lw $s2, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 504($sp)
	addu $sp, $sp, 512
	j $ra

	.text
	.globl C25_init
C25_init:
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
	move $t0 $a1
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
	jalr Create_A25
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
	move $t8 $t9
	move $t7 $t3
	move $s6 $t8
	sw $s6, 12($t7)
	move $s0 $t0
	sub $v0, $s0, 5
	move $s4 $v0
	move $t1 $s4
	move $t6 $t3
	move $t4 $t1
	sw $t4, 4($t6)
	move $s7 $t3
	lw $s1 4($s7)
	move $s5 $s1
	mul $v0, $s5, $t0
	move $t5 $v0
	move $s2 $t5
	move $s3 $t3
	move $t2 $s2
	sw $t2, 8($s3)
	move $t9 $t3
	lw $t8 8($t9)
	move $t7 $t3
	lw $s6 4($t7)
	move $s0 $t8
	sub $v0, $s0, $s6
	move $s4 $v0
	move $t1 $s4
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
