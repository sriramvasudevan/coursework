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
	jalr Create_QS
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
	li $s6 10
	move $s7 $s1
	move $t0 $s6
	move $a0 $s7
	move $a1 $t0
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
	move $t1 $v0
	move $t2 $t1
	move $a0 $t2
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 104
	j $ra

	.text
	.globl Create_QS
Create_QS:
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
	li $a0 16
	jal _halloc
	move $v0 $v0
	move $t3 $v0
	move $t4 $t3
	move $t5 $t4
	la $t6 QS_Sort
	sw $t6, 0($t5)
	move $t7 $t4
	la $t8 QS_Start
	sw $t8, 4($t7)
	move $t9 $t4
	la $s0 QS_Init
	sw $s0, 8($t9)
	move $s2 $t4
	la $s3 QS_Print
	sw $s3, 12($s2)
	li $a0 12
	jal _halloc
	move $v0 $v0
	move $s4 $v0
	move $s1 $s4
	move $s6 $s1
	move $s5 $t4
	sw $s5, 0($s6)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s7 $v0
	move $t0 $s7
	li $t0 0
	move $t1 $s1
	move $t2 $t0
	sw $t2, 4($t1)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t3 $v0
	move $t5 $t3
	li $t5 0
	move $t6 $s1
	move $t7 $t5
	sw $t7, 8($t6)
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
	lw $fp, 496($sp)
	addu $sp, $sp, 504
	j $ra

	.text
	.globl QS_Start
QS_Start:
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
	move $t8 $a0
	move $t9 $a1
	move $s0 $t8
	move $s2 $s0
	lw $s3 0($s2)
	move $s4 $s3
	lw $t4 8($s4)
	move $s6 $t9
	move $s5 $s0
	move $s7 $s6
	move $a0 $s5
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
	move $t0 $v0
	move $t1 $t0
	move $t2 $t1
	move $t3 $t8
	move $t5 $t3
	lw $t6 0($t5)
	move $t7 $t6
	lw $s1 12($t7)
	move $s2 $t3
	move $a0 $s2
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
	move $s4 $s3
	move $t2 $s4
	li $t9 9999
	move $a0 $t9
	jal _print
	move $s0 $t8
	lw $s6 8($s0)
	move $t4 $s6
	sub $v0, $t4, 1
	move $s5 $v0
	move $s7 $s5
	move $t2 $s7
	move $t0 $t8
	move $t1 $t0
	lw $t5 0($t1)
	move $t6 $t5
	lw $t7 0($t6)
	li $t3 0
	move $s1 $t2
	move $s2 $t0
	move $s3 $t3
	move $s4 $s1
	move $a0 $s2
	move $a1 $s3
	move $a2 $s4
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
	move $t9 $v0
	move $s0 $t9
	move $t2 $s0
	move $s6 $t8
	move $t4 $s6
	lw $s5 0($t4)
	move $s7 $s5
	lw $t1 12($s7)
	move $t5 $s6
	move $a0 $t5
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
	move $t6 $v0
	move $t2 $t6
	move $t2 $t2
	li $t0 0
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
	lw $fp, 504($sp)
	addu $sp, $sp, 512
	j $ra

	.text
	.globl QS_Sort
QS_Sort:
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
	move $t7 $a0
	move $s1 $a1
	move $t3 $a2
	li $s2 0
	move $s3 $s2
	move $s4 $s1
	slt $v0, $s4, $t3
	move $t9 $v0
	move $s0 $t9
	beqz $s0 L17
	move $t8 $t7
	lw $t4 4($t8)
	move $s5 $t4
	li $s7 1
	add $v0, $s7, $t3
	move $s6 $v0
	move $t1 $s6
	li $t5 4
	mul $v0, $t5, $t1
	move $t6 $v0
	move $t2 $t6
	move $t0 $s5
	add $v0, $t0, $t2
	move $s2 $v0
	move $s4 $s2
	move $t9 $s4
	lw $s0 0($t9)
	move $t8 $s0
	move $t4 $t8
	move $s7 $s1
	sub $v0, $s7, 1
	move $s6 $v0
	move $t1 $s6
	move $t5 $t1
	move $t6 $t3
	move $s5 $t6
	li $t2 1
	move $t0 $t2
L5:
	move $s2 $t0
	beqz $s2 L16
	li $s4 1
	move $t9 $s4
L6:
	move $s0 $t9
	beqz $s0 L9
	move $t8 $t5
	add $v0, $t8, 1
	move $s7 $v0
	move $s6 $s7
	move $t5 $s6
	move $t1 $t7
	lw $t6 4($t1)
	move $t2 $t6
	li $s2 1
	add $v0, $s2, $t5
	move $s4 $v0
	move $s0 $s4
	li $t8 4
	mul $v0, $t8, $s0
	move $s7 $v0
	move $s6 $s7
	move $t1 $t2
	add $v0, $t1, $s6
	move $t6 $v0
	move $s2 $t6
	move $s4 $s2
	lw $s0 0($s4)
	move $t8 $s0
	move $s7 $t8
	move $t2 $s7
	slt $v0, $t2, $t4
	move $s6 $v0
	move $t1 $s6
	li $t6 1
	sub $v0, $t6, $t1
	move $s2 $v0
	move $s4 $s2
	beqz $s4 L7
	li $s0 0
	move $t9 $s0
	b L8
L7:
	nop
	li $t8 1
	move $t9 $t8
L8:
	nop
	b L6
L9:
	nop
	li $t2 1
	move $t9 $t2
L10:
	move $s6 $t9
	beqz $s6 L13
	move $t1 $s5
	sub $v0, $t1, 1
	move $t6 $v0
	move $s2 $t6
	move $s5 $s2
	move $s4 $t7
	lw $s0 4($s4)
	move $t8 $s0
	li $t2 1
	add $v0, $t2, $s5
	move $s6 $v0
	move $t1 $s6
	li $t6 4
	mul $v0, $t6, $t1
	move $s2 $v0
	move $s4 $s2
	move $s0 $t8
	add $v0, $s0, $s4
	move $t2 $v0
	move $s6 $t2
	move $t1 $s6
	lw $t6 0($t1)
	move $s2 $t6
	move $s7 $s2
	move $t8 $t4
	slt $v0, $t8, $s7
	move $s4 $v0
	move $s0 $s4
	li $t2 1
	sub $v0, $t2, $s0
	move $s6 $v0
	move $t1 $s6
	beqz $t1 L11
	li $t6 0
	move $t9 $t6
	b L12
L11:
	nop
	li $s2 1
	move $t9 $s2
L12:
	nop
	b L10
L13:
	nop
	move $s7 $t7
	lw $t8 4($s7)
	move $s4 $t8
	li $s0 1
	add $v0, $s0, $t5
	move $t2 $v0
	move $s6 $t2
	li $t1 4
	mul $v0, $t1, $s6
	move $t6 $v0
	move $s2 $t6
	move $t9 $s4
	add $v0, $t9, $s2
	move $s7 $v0
	move $t8 $s7
	move $s0 $t8
	lw $t2 0($s0)
	move $s6 $t2
	move $s3 $s6
	li $t1 1
	add $v0, $t1, $t5
	move $t6 $v0
	move $s4 $t6
	move $s2 $t7
	lw $t9 4($s2)
	move $s7 $t9
	li $t8 1
	add $v0, $t8, $s5
	move $s0 $v0
	move $t2 $s0
	li $s6 4
	mul $v0, $s6, $t2
	move $t1 $v0
	move $t6 $t1
	move $s2 $s7
	add $v0, $s2, $t6
	move $t9 $v0
	move $t8 $t9
	move $s0 $t8
	lw $t2 0($s0)
	move $s6 $t2
	li $t1 4
	mul $v0, $t1, $s4
	move $s7 $v0
	move $t6 $s7
	move $s2 $t7
	lw $t9 4($s2)
	move $t8 $t9
	add $v0, $t8, $t6
	move $s0 $v0
	move $t2 $s0
	move $s4 $t2
	move $t1 $s6
	sw $t1, 0($s4)
	move $s7 $t7
	move $s2 $t9
	sw $s2, 4($s7)
	li $t6 1
	add $v0, $t6, $s5
	move $t8 $v0
	move $s0 $t8
	move $t2 $s3
	li $s6 4
	mul $v0, $s6, $s0
	move $s4 $v0
	move $t1 $s4
	move $t9 $t7
	lw $s7 4($t9)
	move $s2 $s7
	add $v0, $s2, $t1
	move $t6 $v0
	move $t8 $t6
	move $s0 $t8
	move $s6 $t2
	sw $s6, 0($s0)
	move $s4 $t7
	move $t9 $s7
	sw $t9, 4($s4)
	move $t1 $t5
	add $v0, $t1, 1
	move $s2 $v0
	move $t6 $s2
	move $t8 $s5
	slt $v0, $t8, $t6
	move $t2 $v0
	move $s0 $t2
	beqz $s0 L14
	li $s6 0
	move $t0 $s6
	b L15
L14:
	nop
	li $s7 1
	move $t0 $s7
L15:
	nop
	b L5
L16:
	nop
	li $s4 1
	add $v0, $s4, $s5
	move $t9 $v0
	move $t1 $t9
	move $s2 $t7
	lw $t6 4($s2)
	move $t8 $t6
	li $t2 1
	add $v0, $t2, $t5
	move $s0 $v0
	move $s6 $s0
	li $s7 4
	mul $v0, $s7, $s6
	move $t4 $v0
	move $t0 $t4
	move $s5 $t8
	add $v0, $s5, $t0
	move $s4 $v0
	move $t9 $s4
	move $s2 $t9
	lw $t6 0($s2)
	move $t2 $t6
	li $s0 4
	mul $v0, $s0, $t1
	move $s6 $v0
	move $s7 $s6
	move $t4 $t7
	lw $t8 4($t4)
	move $t0 $t8
	add $v0, $t0, $s7
	move $s5 $v0
	move $s4 $s5
	move $t9 $s4
	move $s2 $t2
	sw $s2, 0($t9)
	move $t6 $t7
	move $t1 $t8
	sw $t1, 4($t6)
	li $s0 1
	add $v0, $s0, $t5
	move $s6 $v0
	move $t4 $s6
	move $s7 $t7
	lw $t0 4($s7)
	move $s5 $t0
	li $s4 1
	add $v0, $s4, $t3
	move $t2 $v0
	move $t9 $t2
	li $s2 4
	mul $v0, $s2, $t9
	move $t8 $v0
	move $t6 $t8
	move $t1 $s5
	add $v0, $t1, $t6
	move $s0 $v0
	move $s6 $s0
	move $s7 $s6
	lw $t0 0($s7)
	move $s4 $t0
	li $t2 4
	mul $v0, $t2, $t4
	move $t9 $v0
	move $s2 $t9
	move $t8 $t7
	lw $s5 4($t8)
	move $t6 $s5
	add $v0, $t6, $s2
	move $t1 $v0
	move $s0 $t1
	move $s6 $s0
	move $s7 $s4
	sw $s7, 0($s6)
	move $t0 $t7
	move $t4 $s5
	sw $t4, 4($t0)
	li $t2 1
	add $v0, $t2, $t3
	move $t9 $v0
	move $t8 $t9
	move $s2 $s3
	li $t6 4
	mul $v0, $t6, $t8
	move $t1 $v0
	move $s0 $t1
	move $s4 $t7
	lw $s6 4($s4)
	move $s7 $s6
	add $v0, $s7, $s0
	move $s5 $v0
	move $t0 $s5
	move $t4 $t0
	move $t2 $s2
	sw $t2, 0($t4)
	move $t9 $t7
	move $s3 $s6
	sw $s3, 4($t9)
	move $t8 $t7
	move $t6 $t8
	lw $t1 0($t6)
	move $s4 $t1
	lw $s0 0($s4)
	move $s7 $s1
	move $s5 $t5
	sub $v0, $s5, 1
	move $t0 $v0
	move $s2 $t0
	move $t4 $t8
	move $t2 $s7
	move $s6 $s2
	move $a0 $t4
	move $a1 $t2
	move $a2 $s6
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
	move $t9 $v0
	move $s3 $t9
	move $t6 $s3
	move $t1 $t7
	move $s4 $t1
	lw $s1 0($s4)
	move $s5 $s1
	lw $t0 0($s5)
	move $t8 $t5
	add $v0, $t8, 1
	move $s7 $v0
	move $s2 $s7
	move $s0 $t3
	move $t4 $t1
	move $t2 $s2
	move $s6 $s0
	move $a0 $t4
	move $a1 $t2
	move $a2 $s6
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
	jalr $t0
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
	move $s3 $t9
	move $t6 $s3
	b L18
L17:
	nop
	li $t7 0
	move $t6 $t7
L18:
	nop
	li $s4 0
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
	lw $fp, 504($sp)
	addu $sp, $sp, 512
	j $ra

	.text
	.globl QS_Print
QS_Print:
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
	move $s1 $a0
	li $s5 0
	move $t5 $s5
L19:
	move $t8 $s1
	lw $s7 8($t8)
	move $t3 $s7
	move $t1 $t5
	slt $v0, $t1, $t3
	move $s2 $v0
	move $s0 $s2
	beqz $s0 L20
	move $t0 $s1
	lw $t4 4($t0)
	move $t2 $t4
	li $s6 1
	add $v0, $s6, $t5
	move $t9 $v0
	move $s3 $t9
	li $t6 4
	mul $v0, $t6, $s3
	move $t7 $v0
	move $s4 $t7
	move $s5 $t2
	add $v0, $s5, $s4
	move $t8 $v0
	move $s7 $t8
	move $t3 $s7
	lw $t1 0($t3)
	move $s2 $t1
	move $a0 $s2
	jal _print
	move $s0 $t5
	add $v0, $s0, 1
	move $t0 $v0
	move $t4 $t0
	move $t5 $t4
	b L19
L20:
	nop
	li $s6 0
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
	lw $fp, 496($sp)
	addu $sp, $sp, 504
	j $ra

	.text
	.globl QS_Init
QS_Init:
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
	move $t6 $a1
	move $s3 $t6
	move $t7 $t9
	move $t2 $s3
	sw $t2, 8($t7)
	move $s4 $t6
	li $s5 1
	add $v0, $s5, $s4
	move $t8 $v0
	li $s7 4
	mul $v0, $s7, $t8
	move $t3 $v0
	move $a0 $t3
	jal _halloc
	move $v0 $v0
	move $t1 $v0
	move $s2 $t1
	move $s0 $s2
	move $t0 $s4
	sw $t0, 0($s0)
	li $t4 0
L21:
	move $s1 $t4
	slt $v0, $s1, $s4
	move $t5 $v0
	move $s6 $t5
	beqz $s6 L22
	li $s3 1
	add $v0, $s3, $t4
	move $t7 $v0
	move $t2 $t7
	li $t6 4
	mul $v0, $t6, $t2
	move $s5 $v0
	move $t8 $s5
	move $s7 $s2
	add $v0, $s7, $t8
	move $t3 $v0
	move $t1 $t3
	move $s0 $t1
	li $t0 0
	sw $t0, 0($s0)
	move $s1 $t4
	add $v0, $s1, 1
	move $t5 $v0
	move $t4 $t5
	b L21
L22:
	nop
	move $s6 $s2
	move $s3 $t9
	move $t7 $s6
	sw $t7, 4($s3)
	li $t2 1
	add $v0, $t2, 0
	move $t6 $v0
	move $s5 $t6
	li $t8 20
	li $s7 4
	mul $v0, $s7, $s5
	move $t3 $v0
	move $t1 $t3
	move $s0 $t9
	lw $t0 4($s0)
	move $s1 $t0
	add $v0, $s1, $t1
	move $t5 $v0
	move $s4 $t5
	move $t4 $s4
	move $s2 $t8
	sw $s2, 0($t4)
	move $s6 $t9
	move $s3 $t0
	sw $s3, 4($s6)
	li $t7 1
	add $v0, $t7, 1
	move $t2 $v0
	move $t6 $t2
	li $s5 7
	li $s7 4
	mul $v0, $s7, $t6
	move $t3 $v0
	move $s0 $t3
	move $t1 $t9
	lw $s1 4($t1)
	move $t5 $s1
	add $v0, $t5, $s0
	move $s4 $v0
	move $t8 $s4
	move $t4 $t8
	move $s2 $s5
	sw $s2, 0($t4)
	move $t0 $t9
	move $s6 $s1
	sw $s6, 4($t0)
	li $s3 1
	add $v0, $s3, 2
	move $t7 $v0
	move $t2 $t7
	li $t6 12
	li $s7 4
	mul $v0, $s7, $t2
	move $t3 $v0
	move $t1 $t3
	move $s0 $t9
	lw $t5 4($s0)
	move $s4 $t5
	add $v0, $s4, $t1
	move $t8 $v0
	move $s5 $t8
	move $t4 $s5
	move $s2 $t6
	sw $s2, 0($t4)
	move $s1 $t9
	move $t0 $t5
	sw $t0, 4($s1)
	li $s6 1
	add $v0, $s6, 3
	move $s3 $v0
	move $t7 $s3
	li $t2 18
	li $s7 4
	mul $v0, $s7, $t7
	move $t3 $v0
	move $s0 $t3
	move $t1 $t9
	lw $s4 4($t1)
	move $t8 $s4
	add $v0, $t8, $s0
	move $s5 $v0
	move $t6 $s5
	move $t4 $t6
	move $s2 $t2
	sw $s2, 0($t4)
	move $t5 $t9
	move $s1 $s4
	sw $s1, 4($t5)
	li $t0 1
	add $v0, $t0, 4
	move $s6 $v0
	move $s3 $s6
	li $t7 2
	li $s7 4
	mul $v0, $s7, $s3
	move $t3 $v0
	move $t1 $t3
	move $s0 $t9
	lw $t8 4($s0)
	move $s5 $t8
	add $v0, $s5, $t1
	move $t6 $v0
	move $t2 $t6
	move $t4 $t2
	move $s2 $t7
	sw $s2, 0($t4)
	move $s4 $t9
	move $t5 $t8
	sw $t5, 4($s4)
	li $s1 1
	add $v0, $s1, 5
	move $t0 $v0
	move $s6 $t0
	li $s3 11
	li $s7 4
	mul $v0, $s7, $s6
	move $t3 $v0
	move $s0 $t3
	move $t1 $t9
	lw $s5 4($t1)
	move $t6 $s5
	add $v0, $t6, $s0
	move $t2 $v0
	move $t7 $t2
	move $t4 $t7
	move $s2 $s3
	sw $s2, 0($t4)
	move $t8 $t9
	move $s4 $s5
	sw $s4, 4($t8)
	li $t5 1
	add $v0, $t5, 6
	move $s1 $v0
	move $t0 $s1
	li $s6 6
	li $s7 4
	mul $v0, $s7, $t0
	move $t3 $v0
	move $t1 $t3
	move $s0 $t9
	lw $t6 4($s0)
	move $t2 $t6
	add $v0, $t2, $t1
	move $t7 $v0
	move $s3 $t7
	move $t4 $s3
	move $s2 $s6
	sw $s2, 0($t4)
	move $s5 $t9
	move $t8 $t6
	sw $t8, 4($s5)
	li $s4 1
	add $v0, $s4, 7
	move $t5 $v0
	move $s1 $t5
	li $t0 9
	li $s7 4
	mul $v0, $s7, $s1
	move $t3 $v0
	move $s0 $t3
	move $t1 $t9
	lw $t2 4($t1)
	move $t7 $t2
	add $v0, $t7, $s0
	move $s3 $v0
	move $s6 $s3
	move $t4 $s6
	move $s2 $t0
	sw $s2, 0($t4)
	move $t6 $t9
	move $s5 $t2
	sw $s5, 4($t6)
	li $t8 1
	add $v0, $t8, 8
	move $s4 $v0
	move $t5 $s4
	li $s1 19
	li $s7 4
	mul $v0, $s7, $t5
	move $t3 $v0
	move $t1 $t3
	move $s0 $t9
	lw $t7 4($s0)
	move $s3 $t7
	add $v0, $s3, $t1
	move $s6 $v0
	move $t0 $s6
	move $t4 $t0
	move $s2 $s1
	sw $s2, 0($t4)
	move $t2 $t9
	move $t6 $t7
	sw $t6, 4($t2)
	li $s5 1
	add $v0, $s5, 9
	move $t8 $v0
	move $s4 $t8
	li $t5 5
	li $s7 4
	mul $v0, $s7, $s4
	move $t3 $v0
	move $s0 $t3
	move $t1 $t9
	lw $s3 4($t1)
	move $s6 $s3
	add $v0, $s6, $s0
	move $t0 $v0
	move $s1 $t0
	move $t4 $s1
	move $s2 $t5
	sw $s2, 0($t4)
	move $t7 $t9
	move $t2 $s3
	sw $t2, 4($t7)
	li $t6 0
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
