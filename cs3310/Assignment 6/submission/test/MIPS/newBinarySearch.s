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
	jalr Create_BS
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
	li $s6 20
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
	.globl Create_BS
Create_BS:
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
	li $a0 24
	jal _halloc
	move $v0 $v0
	move $t3 $v0
	move $t4 $t3
	move $t5 $t4
	la $t6 BS_Search
	sw $t6, 0($t5)
	move $t7 $t4
	la $t8 BS_Start
	sw $t8, 4($t7)
	move $t9 $t4
	la $s0 BS_Init
	sw $s0, 8($t9)
	move $s2 $t4
	la $s3 BS_Compare
	sw $s3, 12($s2)
	move $s4 $t4
	la $s1 BS_Print
	sw $s1, 16($s4)
	move $s6 $t4
	la $s5 BS_Div
	sw $s5, 20($s6)
	li $a0 12
	jal _halloc
	move $v0 $v0
	move $s7 $v0
	move $t0 $s7
	move $t1 $t0
	move $t2 $t4
	sw $t2, 0($t1)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t3 $v0
	move $t5 $t3
	li $t5 0
	move $t6 $t0
	move $t7 $t5
	sw $t7, 4($t6)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t8 $v0
	move $t9 $t8
	li $t9 0
	move $s0 $t0
	move $s2 $t9
	sw $s2, 8($s0)
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
	.globl BS_Start
BS_Start:
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
	move $s4 $a0
	move $s1 $a1
	move $s3 $s4
	move $s6 $s3
	lw $s5 0($s6)
	move $s7 $s5
	lw $t4 8($s7)
	move $t1 $s1
	move $t2 $s3
	move $t3 $t1
	move $a0 $t2
	move $a1 $t3
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
	move $t5 $v0
	move $t6 $t5
	move $t7 $t6
	move $t8 $s4
	move $t9 $t8
	lw $s0 0($t9)
	move $s2 $s0
	lw $t0 16($s2)
	move $s6 $t8
	move $a0 $s6
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
	move $s5 $v0
	move $s7 $s5
	move $s1 $s7
	move $s3 $s4
	move $t1 $s3
	lw $t4 0($t1)
	move $t2 $t4
	lw $t3 0($t2)
	li $t5 8
	move $t6 $s3
	move $t7 $t5
	move $a0 $t6
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
	jalr $t3
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
	beqz $s0 L7
	li $s2 1
	move $a0 $s2
	jal _print
	b L8
L7:
	nop
	li $t8 0
	move $a0 $t8
	jal _print
L8:
	nop
	move $t0 $s4
	move $s6 $t0
	lw $s5 0($s6)
	move $s7 $s5
	lw $s1 0($s7)
	li $t1 19
	move $t4 $t0
	move $t2 $t1
	move $a0 $t4
	move $a1 $t2
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
	move $t5 $s3
	beqz $t5 L9
	li $t3 1
	move $a0 $t3
	jal _print
	b L10
L9:
	nop
	li $t6 0
	move $a0 $t6
	jal _print
L10:
	nop
	move $t7 $s4
	move $t9 $t7
	lw $s0 0($t9)
	move $s2 $s0
	lw $t8 0($s2)
	li $s6 20
	move $s5 $t7
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
	move $t0 $v0
	move $t1 $t0
	beqz $t1 L11
	li $s1 1
	move $a0 $s1
	jal _print
	b L12
L11:
	nop
	li $t4 0
	move $a0 $t4
	jal _print
L12:
	nop
	move $t2 $s4
	move $s3 $t2
	lw $t5 0($s3)
	move $t3 $t5
	lw $t6 0($t3)
	li $t9 21
	move $s0 $t2
	move $s2 $t9
	move $a0 $s0
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
	jalr $t6
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
	move $s6 $t7
	beqz $s6 L13
	li $t8 1
	move $a0 $t8
	jal _print
	b L14
L13:
	nop
	li $s5 0
	move $a0 $s5
	jal _print
L14:
	nop
	move $s7 $s4
	move $t0 $s7
	lw $t1 0($t0)
	move $s1 $t1
	lw $t4 0($s1)
	li $s3 37
	move $t5 $s7
	move $t3 $s3
	move $a0 $t5
	move $a1 $t3
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
	move $t2 $v0
	move $t9 $t2
	beqz $t9 L15
	li $t6 1
	move $a0 $t6
	jal _print
	b L16
L15:
	nop
	li $s0 0
	move $a0 $s0
	jal _print
L16:
	nop
	move $s2 $s4
	move $t7 $s2
	lw $s6 0($t7)
	move $t8 $s6
	lw $s5 0($t8)
	li $t0 38
	move $t1 $s2
	move $s1 $t0
	move $a0 $t1
	move $a1 $s1
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
	move $s7 $v0
	move $s3 $s7
	beqz $s3 L17
	li $t4 1
	move $a0 $t4
	jal _print
	b L18
L17:
	nop
	li $t5 0
	move $a0 $t5
	jal _print
L18:
	nop
	move $t3 $s4
	move $t2 $t3
	lw $t9 0($t2)
	move $t6 $t9
	lw $s0 0($t6)
	li $t7 39
	move $s6 $t3
	move $t8 $t7
	move $a0 $s6
	move $a1 $t8
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
	move $s2 $v0
	move $t0 $s2
	beqz $t0 L19
	li $s5 1
	move $a0 $s5
	jal _print
	b L20
L19:
	nop
	li $t1 0
	move $a0 $t1
	jal _print
L20:
	nop
	move $s1 $s4
	move $s7 $s1
	lw $s3 0($s7)
	move $t4 $s3
	lw $t5 0($t4)
	li $t2 50
	move $t9 $s1
	move $t6 $t2
	move $a0 $t9
	move $a1 $t6
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
	jalr $t5
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
	move $t3 $v0
	move $t7 $t3
	beqz $t7 L21
	li $s0 1
	move $a0 $s0
	jal _print
	b L22
L21:
	nop
	li $s6 0
	move $a0 $s6
	jal _print
L22:
	nop
	li $t8 999
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
	lw $fp, 500($sp)
	addu $sp, $sp, 508
	j $ra

	.text
	.globl BS_Search
BS_Search:
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
	move $s5 $a0
	move $t0 $a1
	li $s2 0
	move $t1 $s2
	li $s4 0
	move $s7 $s4
	move $s3 $s5
	lw $t4 4($s3)
	move $s1 $t4
	move $t2 $s1
	lw $t5 0($t2)
	move $t9 $t5
	move $t6 $t9
	move $t3 $t6
	sub $v0, $t3, 1
	move $t7 $v0
	move $s0 $t7
	move $t6 $s0
	li $s6 0
	move $t8 $s6
	li $s2 1
	move $s4 $s2
L23:
	move $s3 $s4
	beqz $s3 L30
	move $t4 $t8
	add $v0, $t4, $t6
	move $s1 $v0
	move $t2 $s1
	move $t5 $t2
	move $t9 $s5
	move $t3 $t9
	lw $t7 0($t3)
	move $s0 $t7
	lw $s6 20($s0)
	move $s2 $t5
	move $s3 $t9
	move $t4 $s2
	move $a0 $s3
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
	move $s1 $v0
	move $t2 $s1
	move $t5 $t2
	move $t3 $s5
	lw $t7 4($t3)
	move $s0 $t7
	li $t9 1
	add $v0, $t9, $t5
	move $s2 $v0
	move $s6 $s2
	li $s3 4
	mul $v0, $s3, $s6
	move $t4 $v0
	move $s1 $t4
	move $t2 $s0
	add $v0, $t2, $s1
	move $t3 $v0
	move $t7 $t3
	move $t9 $t7
	lw $s2 0($t9)
	move $s6 $s2
	move $t1 $s6
	move $s3 $t0
	slt $v0, $s3, $t1
	move $t4 $v0
	move $s0 $t4
	beqz $s0 L24
	move $s1 $t5
	sub $v0, $s1, 1
	move $t2 $v0
	move $t3 $t2
	move $t6 $t3
	b L25
L24:
	nop
	move $t7 $t5
	add $v0, $t7, 1
	move $t9 $v0
	move $s2 $t9
	move $t8 $s2
L25:
	nop
	move $s6 $s5
	move $s3 $s6
	lw $t4 0($s3)
	move $s0 $t4
	lw $s1 12($s0)
	move $t2 $t1
	move $t3 $t0
	move $t5 $s6
	move $t7 $t2
	move $t9 $t3
	move $a0 $t5
	move $a1 $t7
	move $a2 $t9
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
	move $s2 $v0
	move $s3 $s2
	beqz $s3 L26
	li $t4 0
	move $s4 $t4
	b L27
L26:
	nop
	li $s0 1
	move $s4 $s0
L27:
	nop
	move $s6 $t6
	slt $v0, $s6, $t8
	move $t2 $v0
	move $t3 $t2
	beqz $t3 L28
	li $s1 0
	move $s4 $s1
	b L29
L28:
	nop
	li $t5 0
	move $t7 $t5
L29:
	nop
	b L23
L30:
	nop
	move $t9 $s5
	move $s2 $t9
	lw $s3 0($s2)
	move $t4 $s3
	lw $s0 12($t4)
	move $s6 $t1
	move $t2 $t0
	move $t3 $t9
	move $s1 $s6
	move $t5 $t2
	move $a0 $t3
	move $a1 $s1
	move $a2 $t5
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
	move $t7 $v0
	move $t6 $t7
	beqz $t6 L31
	li $t8 1
	move $s7 $t8
	b L32
L31:
	nop
	li $s4 0
	move $s7 $s4
L32:
	nop
	move $s5 $s7
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
	lw $fp, 504($sp)
	addu $sp, $sp, 512
	j $ra

	.text
	.globl BS_Div
BS_Div:
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
	move $s2 $a1
	li $s3 0
	move $t4 $s3
	li $t1 0
	move $t0 $t1
	move $t9 $s2
	sub $v0, $t9, 1
	move $s6 $v0
	move $t2 $s6
	move $s0 $t2
L33:
	move $t3 $t0
	slt $v0, $t3, $s0
	move $s1 $v0
	move $t5 $s1
	beqz $t5 L34
	move $t7 $t4
	add $v0, $t7, 1
	move $t6 $v0
	move $t8 $t6
	move $t4 $t8
	move $s4 $t0
	add $v0, $s4, 2
	move $s7 $v0
	move $s5 $s7
	move $t0 $s5
	b L33
L34:
	nop
	move $s3 $t4
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
	lw $fp, 496($sp)
	addu $sp, $sp, 504
	j $ra

	.text
	.globl BS_Compare
BS_Compare:
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
	move $t1 $a1
	move $s2 $a2
	li $t9 0
	move $s6 $t9
	move $t2 $s2
	add $v0, $t2, 1
	move $t3 $v0
	move $s1 $t3
	move $t5 $s1
	move $t7 $t1
	slt $v0, $t7, $s2
	move $t6 $v0
	move $t8 $t6
	beqz $t8 L35
	li $s4 0
	move $s6 $s4
	b L38
L35:
	nop
	move $s7 $t1
	slt $v0, $s7, $t5
	move $s5 $v0
	move $t0 $s5
	li $s0 1
	sub $v0, $s0, $t0
	move $t4 $v0
	move $s3 $t4
	beqz $s3 L36
	li $t9 0
	move $s6 $t9
	b L37
L36:
	nop
	li $t2 1
	move $s6 $t2
L37:
	nop
L38:
	nop
	move $t3 $s6
	move $v0 $t3
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
	.globl BS_Print
BS_Print:
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
	li $s2 1
	move $t7 $s2
L39:
	move $t6 $s1
	lw $t8 8($t6)
	move $s4 $t8
	move $t1 $t7
	slt $v0, $t1, $s4
	move $t5 $v0
	move $s7 $t5
	beqz $s7 L40
	move $s5 $s1
	lw $t0 4($s5)
	move $s0 $t0
	li $t4 1
	add $v0, $t4, $t7
	move $s3 $v0
	move $t9 $s3
	li $t2 4
	mul $v0, $t2, $t9
	move $s6 $v0
	move $t3 $s6
	move $s2 $s0
	add $v0, $s2, $t3
	move $t6 $v0
	move $t8 $t6
	move $s4 $t8
	lw $t1 0($s4)
	move $t5 $t1
	move $a0 $t5
	jal _print
	move $s7 $t7
	add $v0, $s7, 1
	move $s5 $v0
	move $t0 $s5
	move $t7 $t0
	b L39
L40:
	nop
	li $t4 99999
	move $a0 $t4
	jal _print
	li $s3 0
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
	lw $fp, 496($sp)
	addu $sp, $sp, 504
	j $ra

	.text
	.globl BS_Init
BS_Init:
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
	move $t2 $a0
	move $t9 $a1
	move $s6 $t9
	move $s0 $t2
	move $t3 $s6
	sw $t3, 8($s0)
	move $s2 $t9
	li $t6 1
	add $v0, $t6, $s2
	move $t8 $v0
	li $s4 4
	mul $v0, $s4, $t8
	move $t1 $v0
	move $a0 $t1
	jal _halloc
	move $v0 $v0
	move $t5 $v0
	move $s7 $t5
	move $s5 $s7
	move $t0 $s2
	sw $t0, 0($s5)
	li $s1 0
L41:
	move $t7 $s1
	slt $v0, $t7, $s2
	move $t4 $v0
	move $s3 $t4
	beqz $s3 L42
	li $s6 1
	add $v0, $s6, $s1
	move $s0 $v0
	move $t3 $s0
	li $t9 4
	mul $v0, $t9, $t3
	move $t6 $v0
	move $t8 $t6
	move $s4 $s7
	add $v0, $s4, $t8
	move $t1 $v0
	move $t5 $t1
	move $s5 $t5
	li $t0 0
	sw $t0, 0($s5)
	move $t7 $s1
	add $v0, $t7, 1
	move $t4 $v0
	move $s1 $t4
	b L41
L42:
	nop
	move $s3 $s7
	move $s6 $t2
	move $s0 $s3
	sw $s0, 4($s6)
	li $t3 1
	move $t9 $t3
	move $t6 $t2
	lw $t8 8($t6)
	move $s4 $t8
	add $v0, $s4, 1
	move $t1 $v0
	move $t5 $t1
	move $s5 $t5
L43:
	move $t0 $t2
	lw $t7 8($t0)
	move $t4 $t7
	move $s2 $t9
	slt $v0, $s2, $t4
	move $s1 $v0
	move $s7 $s1
	beqz $s7 L44
	li $s3 2
	mul $v0, $s3, $t9
	move $s6 $v0
	move $s0 $s6
	move $t3 $s0
	move $t6 $s5
	sub $v0, $t6, 3
	move $t8 $v0
	move $s4 $t8
	move $t1 $s4
	li $t5 1
	add $v0, $t5, $t9
	move $t0 $v0
	move $t7 $t0
	move $t4 $t3
	add $v0, $t4, $t1
	move $s2 $v0
	move $s1 $s2
	li $s7 4
	mul $v0, $s7, $t7
	move $s3 $v0
	move $s6 $s3
	move $s0 $t2
	lw $t6 4($s0)
	move $t8 $t6
	add $v0, $t8, $s6
	move $s4 $v0
	move $t5 $s4
	move $t0 $t5
	move $t3 $s1
	sw $t3, 0($t0)
	move $t1 $t2
	move $t4 $t6
	sw $t4, 4($t1)
	move $s2 $t9
	add $v0, $s2, 1
	move $t7 $v0
	move $s7 $t7
	move $t9 $s7
	move $s3 $s5
	sub $v0, $s3, 1
	move $s0 $v0
	move $s6 $s0
	move $s5 $s6
	b L43
L44:
	nop
	li $t8 0
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
