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
	lw $fp, 96($sp)
	addu $sp, $sp, 104
	j $ra

	.text
	.globl BS_Start
BS_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 108
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
	li $s3 5
	li $s6 1
	add $v0, $s6, $s3
	move $s5 $v0
	li $s7 4
	mul $v0, $s7, $s5
	move $t4 $v0
	move $a0 $t4
	jal _halloc
	move $v0 $v0
	move $t1 $v0
	move $t2 $t1
	move $t3 $t2
	move $t5 $s3
	sw $t5, 0($t3)
	li $t6 0
L7:
	move $t7 $t6
	slt $v0, $t7, $s3
	move $t8 $v0
	move $t9 $t8
	beqz $t9 L8
	li $s0 1
	add $v0, $s0, $t6
	move $s2 $v0
	move $t0 $s2
	li $s6 4
	mul $v0, $s6, $t0
	move $s5 $v0
	move $s7 $s5
	move $t4 $t2
	add $v0, $t4, $s7
	move $t1 $v0
	move $t3 $t1
	move $t5 $t3
	li $t7 0
	sw $t7, 0($t5)
	move $t8 $t6
	add $v0, $t8, 1
	move $t9 $v0
	move $t6 $t9
	b L7
L8:
	nop
	move $s0 $t2
	move $s2 $s0
	move $t0 $s2
	li $s6 1
	add $v0, $s6, 4
	move $s5 $v0
	move $s7 $s5
	li $t4 4
	mul $v0, $t4, $s7
	move $t1 $v0
	move $t3 $t1
	move $t5 $t0
	add $v0, $t5, $t3
	move $t7 $v0
	move $t8 $t7
	move $t9 $t8
	lw $s3 0($t9)
	move $t6 $s3
	move $t2 $t6
	li $s0 5
	li $s2 1
	add $v0, $s2, $s0
	move $s6 $v0
	li $s5 4
	mul $v0, $s5, $s6
	move $s7 $v0
	move $a0 $s7
	jal _halloc
	move $v0 $v0
	move $t4 $v0
	move $t1 $t4
	move $t0 $t1
	move $t3 $s0
	sw $t3, 0($t0)
	li $t5 0
L9:
	move $t7 $t5
	slt $v0, $t7, $s0
	move $t8 $v0
	move $t9 $t8
	beqz $t9 L10
	li $s3 1
	add $v0, $s3, $t5
	move $t6 $v0
	move $t2 $t6
	li $s2 4
	mul $v0, $s2, $t2
	move $s6 $v0
	move $s5 $s6
	move $s7 $t1
	add $v0, $s7, $s5
	move $t4 $v0
	move $t0 $t4
	move $t3 $t0
	li $t7 0
	sw $t7, 0($t3)
	move $t8 $t5
	add $v0, $t8, 1
	move $t9 $v0
	move $t5 $t9
	b L9
L10:
	nop
	move $s3 $t1
	move $t6 $s3
	li $t2 1
	add $v0, $t2, 4
	move $s2 $v0
	move $s6 $s2
	li $s5 4
	mul $v0, $s5, $s6
	move $s7 $v0
	move $t4 $s7
	move $t0 $t6
	add $v0, $t0, $t4
	move $t3 $v0
	move $t7 $t3
	move $t8 $t7
	lw $t9 0($t8)
	move $s0 $t9
	move $t2 $s0
	move $t5 $s4
	move $t1 $t5
	lw $s3 0($t1)
	move $t2 $s3
	lw $s2 8($t2)
	move $s6 $s1
	move $s5 $t5
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
	jalr $s2
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
	move $t4 $t6
	move $t0 $t4
	move $t3 $s4
	move $t7 $t3
	lw $t8 0($t7)
	move $t9 $t8
	lw $s0 16($t9)
	move $t1 $t3
	move $a0 $t1
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
	move $s3 $v0
	move $t2 $s3
	move $s1 $t2
	move $t5 $s4
	move $s6 $t5
	lw $s2 0($s6)
	move $s5 $s2
	lw $s7 0($s5)
	li $t6 8
	move $t4 $t5
	move $t0 $t6
	move $a0 $t4
	move $a1 $t0
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
	jalr $s7
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
	beqz $t8 L11
	li $t9 1
	move $a0 $t9
	jal _print
	b L12
L11:
	nop
	li $t3 0
	move $a0 $t3
	jal _print
L12:
	nop
	move $s0 $s4
	move $t1 $s0
	lw $s3 0($t1)
	move $t2 $s3
	lw $s1 0($t2)
	li $s6 19
	move $s2 $s0
	move $s5 $s6
	move $a0 $s2
	move $a1 $s5
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
	move $t5 $v0
	move $t6 $t5
	beqz $t6 L13
	li $s7 1
	move $a0 $s7
	jal _print
	b L14
L13:
	nop
	li $t4 0
	move $a0 $t4
	jal _print
L14:
	nop
	move $t0 $s4
	move $t7 $t0
	lw $t8 0($t7)
	move $t9 $t8
	lw $t3 0($t9)
	li $t1 20
	move $s3 $t0
	move $t2 $t1
	move $a0 $s3
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
	move $s0 $v0
	move $s6 $s0
	beqz $s6 L15
	li $s1 1
	move $a0 $s1
	jal _print
	b L16
L15:
	nop
	li $s2 0
	move $a0 $s2
	jal _print
L16:
	nop
	move $s5 $s4
	move $t5 $s5
	lw $t6 0($t5)
	move $s7 $t6
	lw $t4 0($s7)
	li $t7 21
	move $t8 $s5
	move $t9 $t7
	move $a0 $t8
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
	beqz $t1 L17
	li $t3 1
	move $a0 $t3
	jal _print
	b L18
L17:
	nop
	li $s3 0
	move $a0 $s3
	jal _print
L18:
	nop
	move $t2 $s4
	move $s0 $t2
	lw $s6 0($s0)
	move $s1 $s6
	lw $s2 0($s1)
	li $t5 37
	move $t6 $t2
	move $s7 $t5
	move $a0 $t6
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
	jalr $s2
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
	move $t7 $s5
	beqz $t7 L19
	li $t4 1
	move $a0 $t4
	jal _print
	b L20
L19:
	nop
	li $t8 0
	move $a0 $t8
	jal _print
L20:
	nop
	move $t9 $s4
	move $t0 $t9
	lw $t1 0($t0)
	move $t3 $t1
	lw $s3 0($t3)
	li $s0 38
	move $s6 $t9
	move $s1 $s0
	move $a0 $s6
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
	jalr $s3
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
	move $t5 $t2
	beqz $t5 L21
	li $s2 1
	move $a0 $s2
	jal _print
	b L22
L21:
	nop
	li $t6 0
	move $a0 $t6
	jal _print
L22:
	nop
	move $s7 $s4
	move $s5 $s7
	lw $t7 0($s5)
	move $t4 $t7
	lw $t8 0($t4)
	li $t0 39
	move $t1 $s7
	move $t3 $t0
	move $a0 $t1
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
	move $t9 $v0
	move $s0 $t9
	beqz $s0 L23
	li $s3 1
	move $a0 $s3
	jal _print
	b L24
L23:
	nop
	li $s6 0
	move $a0 $s6
	jal _print
L24:
	nop
	move $s1 $s4
	move $t2 $s1
	lw $t5 0($t2)
	move $s2 $t5
	lw $t6 0($s2)
	li $s5 50
	move $t7 $s1
	move $t4 $s5
	move $a0 $t7
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
	move $s7 $v0
	move $t0 $s7
	beqz $t0 L25
	li $t8 1
	move $a0 $t8
	jal _print
	b L26
L25:
	nop
	li $t1 0
	move $a0 $t1
	jal _print
L26:
	nop
	li $t3 999
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
	lw $fp, 100($sp)
	addu $sp, $sp, 108
	j $ra

	.text
	.globl BS_Search
BS_Search:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 112
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
	move $s0 $a1
	li $t9 0
	move $s6 $t9
	li $s4 0
	move $t2 $s4
	move $t5 $s3
	lw $s2 4($t5)
	move $s1 $s2
	move $s5 $s1
	lw $t6 0($s5)
	move $t7 $t6
	move $t4 $t7
	move $s7 $t4
	sub $v0, $s7, 1
	move $t0 $v0
	move $t8 $t0
	move $t4 $t8
	li $t1 0
	move $t3 $t1
	li $t9 1
	move $s4 $t9
L27:
	move $t5 $s4
	beqz $t5 L34
	move $s2 $t3
	add $v0, $s2, $t4
	move $s1 $v0
	move $s5 $s1
	move $t6 $s5
	move $t7 $s3
	move $s7 $t7
	lw $t0 0($s7)
	move $t8 $t0
	lw $t1 20($t8)
	move $t9 $t6
	move $t5 $t7
	move $s2 $t9
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
	move $s1 $v0
	move $s5 $s1
	move $t6 $s5
	move $s7 $s3
	lw $t0 4($s7)
	move $t8 $t0
	li $t7 1
	add $v0, $t7, $t6
	move $t9 $v0
	move $t1 $t9
	li $t5 4
	mul $v0, $t5, $t1
	move $s2 $v0
	move $s1 $s2
	move $s5 $t8
	add $v0, $s5, $s1
	move $s7 $v0
	move $t0 $s7
	move $t7 $t0
	lw $t9 0($t7)
	move $t1 $t9
	move $s6 $t1
	move $t5 $s0
	slt $v0, $t5, $s6
	move $s2 $v0
	move $t8 $s2
	beqz $t8 L28
	move $s1 $t6
	sub $v0, $s1, 1
	move $s5 $v0
	move $s7 $s5
	move $t4 $s7
	b L29
L28:
	nop
	move $t0 $t6
	add $v0, $t0, 1
	move $t7 $v0
	move $t9 $t7
	move $t3 $t9
L29:
	nop
	move $t1 $s3
	move $t5 $t1
	lw $s2 0($t5)
	move $t8 $s2
	lw $s1 12($t8)
	move $s5 $s6
	move $s7 $s0
	move $t6 $t1
	move $t0 $s5
	move $t7 $s7
	move $a0 $t6
	move $a1 $t0
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
	move $t9 $v0
	move $t5 $t9
	beqz $t5 L30
	li $s2 0
	move $s4 $s2
	b L31
L30:
	nop
	li $t8 1
	move $s4 $t8
L31:
	nop
	move $t1 $t4
	slt $v0, $t1, $t3
	move $s5 $v0
	move $s7 $s5
	beqz $s7 L32
	li $s1 0
	move $s4 $s1
	b L33
L32:
	nop
	li $t6 0
	move $t0 $t6
L33:
	nop
	b L27
L34:
	nop
	move $t7 $s3
	move $t9 $t7
	lw $t5 0($t9)
	move $s2 $t5
	lw $t8 12($s2)
	move $t1 $s6
	move $s5 $s0
	move $s7 $t7
	move $s1 $t1
	move $t6 $s5
	move $a0 $s7
	move $a1 $s1
	move $a2 $t6
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
	move $t4 $t0
	beqz $t4 L35
	li $t3 1
	move $t2 $t3
	b L36
L35:
	nop
	li $s4 0
	move $t2 $s4
L36:
	nop
	move $s3 $t2
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
	lw $fp, 104($sp)
	addu $sp, $sp, 112
	j $ra

	.text
	.globl BS_Div
BS_Div:
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
	move $t9 $a1
	li $t5 0
	move $s2 $t5
	li $s6 0
	move $s0 $s6
	move $t7 $t9
	sub $v0, $t7, 1
	move $t1 $v0
	move $s5 $t1
	move $t8 $s5
L37:
	move $s7 $s0
	slt $v0, $s7, $t8
	move $s1 $v0
	move $t6 $s1
	beqz $t6 L38
	move $t0 $s2
	add $v0, $t0, 1
	move $t4 $v0
	move $t3 $t4
	move $s2 $t3
	move $s4 $s0
	add $v0, $s4, 2
	move $t2 $v0
	move $s3 $t2
	move $s0 $s3
	b L37
L38:
	nop
	move $t5 $s2
	move $v0 $t5
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
	.globl BS_Compare
BS_Compare:
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
	move $t9 $a2
	li $t7 0
	move $t1 $t7
	move $s5 $t9
	add $v0, $s5, 1
	move $s7 $v0
	move $s1 $s7
	move $t6 $s1
	move $t0 $s6
	slt $v0, $t0, $t9
	move $t4 $v0
	move $t3 $t4
	beqz $t3 L39
	li $s4 0
	move $t1 $s4
	b L42
L39:
	nop
	move $t2 $s6
	slt $v0, $t2, $t6
	move $s3 $v0
	move $s0 $s3
	li $t8 1
	sub $v0, $t8, $s0
	move $s2 $v0
	move $t5 $s2
	beqz $t5 L40
	li $t7 0
	move $t1 $t7
	b L41
L40:
	nop
	li $s5 1
	move $t1 $s5
L41:
	nop
L42:
	nop
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
	.globl BS_Print
BS_Print:
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
	li $t9 1
	move $t0 $t9
L43:
	move $t4 $s1
	lw $t3 8($t4)
	move $s4 $t3
	move $s6 $t0
	slt $v0, $s6, $s4
	move $t6 $v0
	move $t2 $t6
	beqz $t2 L44
	move $s3 $s1
	lw $s0 4($s3)
	move $t8 $s0
	li $s2 1
	add $v0, $s2, $t0
	move $t5 $v0
	move $t7 $t5
	li $s5 4
	mul $v0, $s5, $t7
	move $t1 $v0
	move $s7 $t1
	move $t9 $t8
	add $v0, $t9, $s7
	move $t4 $v0
	move $t3 $t4
	move $s4 $t3
	lw $s6 0($s4)
	move $t6 $s6
	move $a0 $t6
	jal _print
	move $t2 $t0
	add $v0, $t2, 1
	move $s3 $v0
	move $s0 $s3
	move $t0 $s0
	b L43
L44:
	nop
	li $s2 99999
	move $a0 $s2
	jal _print
	li $t5 0
	move $v0 $t5
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
	.globl BS_Init
BS_Init:
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
	move $s5 $a0
	move $t7 $a1
	move $t1 $t7
	move $t8 $s5
	move $s7 $t1
	sw $s7, 8($t8)
	move $t9 $t7
	li $t4 1
	add $v0, $t4, $t9
	move $t3 $v0
	li $s4 4
	mul $v0, $s4, $t3
	move $s6 $v0
	move $a0 $s6
	jal _halloc
	move $v0 $v0
	move $t6 $v0
	move $t2 $t6
	move $s3 $t2
	move $s0 $t9
	sw $s0, 0($s3)
	li $s1 0
L45:
	move $t0 $s1
	slt $v0, $t0, $t9
	move $s2 $v0
	move $t5 $s2
	beqz $t5 L46
	li $t1 1
	add $v0, $t1, $s1
	move $t8 $v0
	move $s7 $t8
	li $t7 4
	mul $v0, $t7, $s7
	move $t4 $v0
	move $t3 $t4
	move $s4 $t2
	add $v0, $s4, $t3
	move $s6 $v0
	move $t6 $s6
	move $s3 $t6
	li $s0 0
	sw $s0, 0($s3)
	move $t0 $s1
	add $v0, $t0, 1
	move $s2 $v0
	move $s1 $s2
	b L45
L46:
	nop
	move $t5 $t2
	move $t1 $s5
	move $t8 $t5
	sw $t8, 4($t1)
	li $s7 1
	move $t7 $s7
	move $t4 $s5
	lw $t3 8($t4)
	move $s4 $t3
	add $v0, $s4, 1
	move $s6 $v0
	move $t6 $s6
	move $s3 $t6
L47:
	move $s0 $s5
	lw $t0 8($s0)
	move $s2 $t0
	move $t9 $t7
	slt $v0, $t9, $s2
	move $s1 $v0
	move $t2 $s1
	beqz $t2 L48
	li $t5 2
	mul $v0, $t5, $t7
	move $t1 $v0
	move $t8 $t1
	move $s7 $t8
	move $t4 $s3
	sub $v0, $t4, 3
	move $t3 $v0
	move $s4 $t3
	move $s6 $s4
	li $t6 1
	add $v0, $t6, $t7
	move $s0 $v0
	move $t0 $s0
	move $s2 $s7
	add $v0, $s2, $s6
	move $t9 $v0
	move $s1 $t9
	li $t2 4
	mul $v0, $t2, $t0
	move $t5 $v0
	move $t1 $t5
	move $t8 $s5
	lw $t4 4($t8)
	move $t3 $t4
	add $v0, $t3, $t1
	move $s4 $v0
	move $t6 $s4
	move $s0 $t6
	move $s7 $s1
	sw $s7, 0($s0)
	move $s6 $s5
	move $s2 $t4
	sw $s2, 4($s6)
	move $t9 $t7
	add $v0, $t9, 1
	move $t0 $v0
	move $t2 $t0
	move $t7 $t2
	move $t5 $s3
	sub $v0, $t5, 1
	move $t8 $v0
	move $t1 $t8
	move $s3 $t1
	b L47
L48:
	nop
	li $t3 0
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
