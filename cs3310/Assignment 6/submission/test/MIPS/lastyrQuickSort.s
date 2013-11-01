	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 104
	sw $ra, -4($fp)
	li $a0 16
	jal _halloc
	move $v0 $v0
	move $s0 $v0
	li $a0 12
	jal _halloc
	move $v0 $v0
	move $s1 $v0
	la $s2 QS_Init
	sw $s2, 12($s0)
	la $s3 QS_Print
	sw $s3, 8($s0)
	la $s4 QS_Sort
	sw $s4, 4($s0)
	la $s5 QS_Start
	sw $s5, 0($s0)
	li $s6 4
L4:
	nop
	li $s7 12
	slt $v0, $s6, $s7
	move $t0 $v0
	beqz $t0 L5
	add $v0, $s1, $s6
	move $t1 $v0
	li $t2 0
	sw $t2, 0($t1)
	add $v0, $s6, 4
	move $s6 $v0
	b L4
L5:
	nop
	sw $s0, 0($s1)
	move $t3 $s1
	lw $t4 0($t3)
	lw $t5 0($t4)
	li $t6 10
	move $a0 $t3
	move $a1 $t6
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
	jalr $t5
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
	move $t7 $v0
	move $a0 $t7
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 104
	j $ra

	.text
	.globl QS_Start
QS_Start:
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
	move $t9 $a0
	move $s2 $a1
	move $t8 $t9
	lw $s3 0($t8)
	lw $s4 12($s3)
	move $a0 $t8
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
	jalr $s4
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
	move $t0 $t9
	lw $t1 0($t0)
	lw $t2 8($t1)
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
	jalr $t2
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
	move $s6 $v0
	move $s7 $s6
	li $s0 9999
	move $a0 $s0
	jal _print
	lw $s1 8($t9)
	li $t4 1
	sub $v0, $s1, $t4
	move $s7 $v0
	move $t3 $t9
	lw $t5 0($t3)
	lw $t6 4($t5)
	li $t7 0
	move $a0 $t3
	move $a1 $t7
	move $a2 $s7
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
	move $s3 $v0
	move $s7 $s3
	move $t8 $t9
	lw $s2 0($t8)
	lw $s4 8($s2)
	move $a0 $t8
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
	jalr $s4
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
	li $t1 0
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
	lw $fp, 104($sp)
	addu $sp, $sp, 112
	j $ra

	.text
	.globl QS_Sort
QS_Sort:
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
	move $s6 $a0
	move $t2 $a1
	move $t0 $a2
	li $s0 0
	slt $v0, $t2, $t0
	move $s1 $v0
	beqz $s1 L30
	lw $t4 4($s6)
	mul $v0, $t0, 4
	move $t5 $v0
	lw $t4 4($s6)
	lw $s7 0($t4)
	li $t3 1
	slt $v0, $t5, $s7
	move $t6 $v0
	sub $v0, $t3, $t6
	move $t7 $v0
	beqz $t7 L6
	li $v0, 4
	la $a0, str_er
	syscall
L6:
	nop
	li $s3 4
	move $t9 $s3
	add $v0, $t5, $t9
	move $s2 $v0
	move $t8 $s2
	add $v0, $t4, $t8
	move $s4 $v0
	lw $s5 0($s4)
	move $t1 $s5
	sub $v0, $t2, 1
	move $s1 $v0
	move $s7 $t0
	li $t3 1
L7:
	nop
	beqz $t3 L24
	li $t6 1
L8:
	nop
	beqz $t6 L12
	add $v0, $s1, 1
	move $s1 $v0
	lw $t7 4($s6)
	mul $v0, $s1, 4
	move $s3 $v0
	lw $t7 4($s6)
	lw $t5 0($t7)
	li $t9 1
	slt $v0, $s3, $t5
	move $s2 $v0
	sub $v0, $t9, $s2
	move $t4 $v0
	beqz $t4 L9
	li $v0, 4
	la $a0, str_er
	syscall
L9:
	nop
	li $t8 4
	move $s4 $t8
	add $v0, $s3, $s4
	move $s5 $v0
	move $t5 $s5
	add $v0, $t7, $t5
	move $t9 $v0
	lw $s2 0($t9)
	move $t4 $s2
	li $t8 1
	slt $v0, $t4, $t1
	move $s3 $v0
	sub $v0, $t8, $s3
	move $s4 $v0
	beqz $s4 L10
	li $t6 0
	b L11
L10:
	nop
	li $t6 1
L11:
	nop
	b L8
L12:
	nop
	li $t6 1
L13:
	nop
	beqz $t6 L17
	sub $v0, $s7, 1
	move $s7 $v0
	lw $s5 4($s6)
	mul $v0, $s7, 4
	move $t7 $v0
	lw $s5 4($s6)
	lw $t5 0($s5)
	li $t9 1
	slt $v0, $t7, $t5
	move $s2 $v0
	sub $v0, $t9, $s2
	move $t8 $v0
	beqz $t8 L14
	li $v0, 4
	la $a0, str_er
	syscall
L14:
	nop
	li $s3 4
	move $s4 $s3
	add $v0, $t7, $s4
	move $t5 $v0
	move $t9 $t5
	add $v0, $s5, $t9
	move $s2 $v0
	lw $t8 0($s2)
	move $t4 $t8
	li $s3 1
	slt $v0, $t1, $t4
	move $t7 $v0
	sub $v0, $s3, $t7
	move $s4 $v0
	beqz $s4 L15
	li $t6 0
	b L16
L15:
	nop
	li $t6 1
L16:
	nop
	b L13
L17:
	nop
	lw $t5 4($s6)
	mul $v0, $s1, 4
	move $s5 $v0
	lw $t5 4($s6)
	lw $t9 0($t5)
	li $s2 1
	slt $v0, $s5, $t9
	move $t8 $v0
	sub $v0, $s2, $t8
	move $t4 $v0
	beqz $t4 L18
	li $v0, 4
	la $a0, str_er
	syscall
L18:
	nop
	li $s3 4
	move $t7 $s3
	add $v0, $s5, $t7
	move $s4 $v0
	move $t6 $s4
	add $v0, $t5, $t6
	move $t9 $v0
	lw $s2 0($t9)
	move $s0 $s2
	li $t8 1
	mul $v0, $t8, 4
	move $t4 $v0
	add $v0, $s6, $t4
	move $s3 $v0
	lw $s5 0($s3)
	mul $v0, $s1, 4
	move $t7 $v0
	li $s4 1
	mul $v0, $s4, 4
	move $t4 $v0
	add $v0, $s6, $t4
	move $t5 $v0
	lw $s5 0($t5)
	lw $t6 0($s5)
	li $t9 1
	slt $v0, $t7, $t6
	move $s2 $v0
	sub $v0, $t9, $s2
	move $t8 $v0
	beqz $t8 L19
	li $v0, 4
	la $a0, str_er
	syscall
L19:
	nop
	li $s3 4
	move $s4 $s3
	add $v0, $t7, $s4
	move $t4 $v0
	move $t5 $t4
	add $v0, $s5, $t5
	move $t6 $v0
	lw $t9 4($s6)
	mul $v0, $s7, 4
	move $s2 $v0
	lw $t9 4($s6)
	lw $t8 0($t9)
	li $s3 1
	slt $v0, $s2, $t8
	move $t7 $v0
	sub $v0, $s3, $t7
	move $s4 $v0
	beqz $s4 L20
	li $v0, 4
	la $a0, str_er
	syscall
L20:
	nop
	li $t4 4
	move $s5 $t4
	add $v0, $s2, $s5
	move $t5 $v0
	move $t8 $t5
	add $v0, $t9, $t8
	move $s3 $v0
	lw $t7 0($s3)
	sw $t7, 0($t6)
	li $s4 1
	mul $v0, $s4, 4
	move $t4 $v0
	add $v0, $s6, $t4
	move $s2 $v0
	lw $s5 0($s2)
	mul $v0, $s7, 4
	move $t5 $v0
	li $t9 1
	mul $v0, $t9, 4
	move $t4 $v0
	add $v0, $s6, $t4
	move $t8 $v0
	lw $s5 0($t8)
	lw $s3 0($s5)
	li $t6 1
	slt $v0, $t5, $s3
	move $t7 $v0
	sub $v0, $t6, $t7
	move $s4 $v0
	beqz $s4 L21
	li $v0, 4
	la $a0, str_er
	syscall
L21:
	nop
	li $s2 4
	move $t9 $s2
	add $v0, $t5, $t9
	move $t4 $v0
	move $t8 $t4
	add $v0, $s5, $t8
	move $s3 $v0
	sw $s0, 0($s3)
	li $t6 1
	add $v0, $s1, $t6
	move $t7 $v0
	slt $v0, $s7, $t7
	move $s4 $v0
	beqz $s4 L22
	li $t3 0
	b L23
L22:
	nop
	li $t3 1
L23:
	nop
	b L7
L24:
	nop
	li $s2 1
	mul $v0, $s2, 4
	move $t5 $v0
	add $v0, $s6, $t5
	move $t9 $v0
	lw $t4 0($t9)
	mul $v0, $s7, 4
	move $s5 $v0
	li $t8 1
	mul $v0, $t8, 4
	move $t5 $v0
	add $v0, $s6, $t5
	move $s3 $v0
	lw $t4 0($s3)
	lw $t6 0($t4)
	li $t7 1
	slt $v0, $s5, $t6
	move $s4 $v0
	sub $v0, $t7, $s4
	move $t1 $v0
	beqz $t1 L25
	li $v0, 4
	la $a0, str_er
	syscall
L25:
	nop
	li $t3 4
	move $s2 $t3
	add $v0, $s5, $s2
	move $t9 $v0
	move $s7 $t9
	add $v0, $t4, $s7
	move $t8 $v0
	lw $t5 4($s6)
	mul $v0, $s1, 4
	move $s3 $v0
	lw $t5 4($s6)
	lw $t6 0($t5)
	li $t7 1
	slt $v0, $s3, $t6
	move $s4 $v0
	sub $v0, $t7, $s4
	move $t1 $v0
	beqz $t1 L26
	li $v0, 4
	la $a0, str_er
	syscall
L26:
	nop
	li $t3 4
	move $s5 $t3
	add $v0, $s3, $s5
	move $s2 $v0
	move $t9 $s2
	add $v0, $t5, $t9
	move $t4 $v0
	lw $s7 0($t4)
	sw $s7, 0($t8)
	li $t6 1
	mul $v0, $t6, 4
	move $t7 $v0
	add $v0, $s6, $t7
	move $s4 $v0
	lw $t1 0($s4)
	mul $v0, $s1, 4
	move $t3 $v0
	li $s3 1
	mul $v0, $s3, 4
	move $t7 $v0
	add $v0, $s6, $t7
	move $s5 $v0
	lw $t1 0($s5)
	lw $s2 0($t1)
	li $t5 1
	slt $v0, $t3, $s2
	move $t9 $v0
	sub $v0, $t5, $t9
	move $t4 $v0
	beqz $t4 L27
	li $v0, 4
	la $a0, str_er
	syscall
L27:
	nop
	li $t8 4
	move $s7 $t8
	add $v0, $t3, $s7
	move $t6 $v0
	move $s4 $t6
	add $v0, $t1, $s4
	move $s3 $v0
	lw $t7 4($s6)
	mul $v0, $t0, 4
	move $s5 $v0
	lw $t7 4($s6)
	lw $s2 0($t7)
	li $t5 1
	slt $v0, $s5, $s2
	move $t9 $v0
	sub $v0, $t5, $t9
	move $t4 $v0
	beqz $t4 L28
	li $v0, 4
	la $a0, str_er
	syscall
L28:
	nop
	li $t8 4
	move $t3 $t8
	add $v0, $s5, $t3
	move $s7 $v0
	move $t6 $s7
	add $v0, $t7, $t6
	move $t1 $v0
	lw $s4 0($t1)
	sw $s4, 0($s3)
	li $s2 1
	mul $v0, $s2, 4
	move $t5 $v0
	add $v0, $s6, $t5
	move $t9 $v0
	lw $t4 0($t9)
	mul $v0, $t0, 4
	move $t8 $v0
	li $s5 1
	mul $v0, $s5, 4
	move $t5 $v0
	add $v0, $s6, $t5
	move $t3 $v0
	lw $t4 0($t3)
	lw $s7 0($t4)
	li $t7 1
	slt $v0, $t8, $s7
	move $t6 $v0
	sub $v0, $t7, $t6
	move $t1 $v0
	beqz $t1 L29
	li $v0, 4
	la $a0, str_er
	syscall
L29:
	nop
	li $s3 4
	move $s4 $s3
	add $v0, $t8, $s4
	move $s2 $v0
	move $t9 $s2
	add $v0, $t4, $t9
	move $s5 $v0
	sw $s0, 0($s5)
	move $t5 $s6
	lw $t3 0($t5)
	lw $s7 4($t3)
	li $t7 1
	sub $v0, $s1, $t7
	move $t6 $v0
	move $a0 $t5
	move $a1 $t2
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
	move $t1 $v0
	move $s3 $t1
	move $t8 $s6
	lw $s4 0($t8)
	lw $s2 4($s4)
	li $t4 1
	add $v0, $s1, $t4
	move $t9 $v0
	move $a0 $t8
	move $a1 $t9
	move $a2 $t0
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
	move $s0 $v0
	move $s3 $s0
	b L31
L30:
	nop
	li $s3 0
L31:
	nop
	li $s5 0
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
	lw $fp, 104($sp)
	addu $sp, $sp, 112
	j $ra

	.text
	.globl QS_Print
QS_Print:
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
	move $t7 $a0
	li $t3 0
L32:
	nop
	lw $t2 8($t7)
	slt $v0, $t3, $t2
	move $t5 $v0
	beqz $t5 L34
	lw $s7 4($t7)
	mul $v0, $t3, 4
	move $t6 $v0
	lw $s7 4($t7)
	lw $t1 0($s7)
	li $s6 1
	slt $v0, $t6, $t1
	move $s4 $v0
	sub $v0, $s6, $s4
	move $s1 $v0
	beqz $s1 L33
	li $v0, 4
	la $a0, str_er
	syscall
L33:
	nop
	li $t4 4
	move $t0 $t4
	add $v0, $t6, $t0
	move $t8 $v0
	move $s2 $t8
	add $v0, $s7, $s2
	move $t9 $v0
	lw $s0 0($t9)
	move $a0 $s0
	jal _print
	add $v0, $t3, 1
	move $t3 $v0
	b L32
L34:
	nop
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
	lw $fp, 96($sp)
	addu $sp, $sp, 104
	j $ra

	.text
	.globl QS_Init
QS_Init:
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
	move $t2 $a1
	sw $t2, 8($s5)
	add $v0, $t2, 1
	move $t5 $v0
	li $t1 4
	mul $v0, $t5, $t1
	move $s6 $v0
	move $a0 $s6
	jal _halloc
	move $v0 $v0
	move $s4 $v0
	li $s1 4
L35:
	nop
	li $t4 1
	add $v0, $t2, $t4
	move $t6 $v0
	li $t0 4
	move $t8 $t0
	mul $v0, $t6, $t8
	move $s7 $v0
	slt $v0, $s1, $s7
	move $s2 $v0
	beqz $s2 L36
	add $v0, $s4, $s1
	move $t9 $v0
	li $s0 0
	sw $s0, 0($t9)
	add $v0, $s1, 4
	move $s1 $v0
	b L35
L36:
	nop
	li $t3 4
	mul $v0, $t2, $t3
	move $t7 $v0
	sw $t7, 0($s4)
	sw $s4, 4($s5)
	li $s3 1
	mul $v0, $s3, 4
	move $t5 $v0
	add $v0, $s5, $t5
	move $t1 $v0
	lw $s6 0($t1)
	li $t4 0
	mul $v0, $t4, 4
	move $t0 $v0
	li $t6 1
	mul $v0, $t6, 4
	move $t5 $v0
	add $v0, $s5, $t5
	move $t8 $v0
	lw $s6 0($t8)
	lw $s7 0($s6)
	li $s2 1
	slt $v0, $t0, $s7
	move $t9 $v0
	sub $v0, $s2, $t9
	move $s0 $v0
	beqz $s0 L37
	li $v0, 4
	la $a0, str_er
	syscall
L37:
	nop
	li $s1 4
	move $t2 $s1
	add $v0, $t0, $t2
	move $t3 $v0
	move $t7 $t3
	add $v0, $s6, $t7
	move $s4 $v0
	li $s3 20
	sw $s3, 0($s4)
	li $t1 1
	mul $v0, $t1, 4
	move $t4 $v0
	add $v0, $s5, $t4
	move $t6 $v0
	lw $t5 0($t6)
	li $t8 1
	mul $v0, $t8, 4
	move $s7 $v0
	li $s2 1
	mul $v0, $s2, 4
	move $t4 $v0
	add $v0, $s5, $t4
	move $t9 $v0
	lw $t5 0($t9)
	lw $s0 0($t5)
	li $s1 1
	slt $v0, $s7, $s0
	move $t0 $v0
	sub $v0, $s1, $t0
	move $t2 $v0
	beqz $t2 L38
	li $v0, 4
	la $a0, str_er
	syscall
L38:
	nop
	li $t3 4
	move $s6 $t3
	add $v0, $s7, $s6
	move $t7 $v0
	move $s4 $t7
	add $v0, $t5, $s4
	move $s3 $v0
	li $t1 7
	sw $t1, 0($s3)
	li $t6 1
	mul $v0, $t6, 4
	move $t8 $v0
	add $v0, $s5, $t8
	move $s2 $v0
	lw $t4 0($s2)
	li $t9 2
	mul $v0, $t9, 4
	move $s0 $v0
	li $s1 1
	mul $v0, $s1, 4
	move $t8 $v0
	add $v0, $s5, $t8
	move $t0 $v0
	lw $t4 0($t0)
	lw $t2 0($t4)
	li $t3 1
	slt $v0, $s0, $t2
	move $s7 $v0
	sub $v0, $t3, $s7
	move $s6 $v0
	beqz $s6 L39
	li $v0, 4
	la $a0, str_er
	syscall
L39:
	nop
	li $t7 4
	move $t5 $t7
	add $v0, $s0, $t5
	move $s4 $v0
	move $s3 $s4
	add $v0, $t4, $s3
	move $t1 $v0
	li $t6 12
	sw $t6, 0($t1)
	li $s2 1
	mul $v0, $s2, 4
	move $t9 $v0
	add $v0, $s5, $t9
	move $s1 $v0
	lw $t8 0($s1)
	li $t0 3
	mul $v0, $t0, 4
	move $t2 $v0
	li $t3 1
	mul $v0, $t3, 4
	move $t9 $v0
	add $v0, $s5, $t9
	move $s7 $v0
	lw $t8 0($s7)
	lw $s6 0($t8)
	li $t7 1
	slt $v0, $t2, $s6
	move $s0 $v0
	sub $v0, $t7, $s0
	move $t5 $v0
	beqz $t5 L40
	li $v0, 4
	la $a0, str_er
	syscall
L40:
	nop
	li $s4 4
	move $t4 $s4
	add $v0, $t2, $t4
	move $s3 $v0
	move $t1 $s3
	add $v0, $t8, $t1
	move $t6 $v0
	li $s2 18
	sw $s2, 0($t6)
	li $s1 1
	mul $v0, $s1, 4
	move $t0 $v0
	add $v0, $s5, $t0
	move $t3 $v0
	lw $t9 0($t3)
	li $s7 4
	mul $v0, $s7, 4
	move $s6 $v0
	li $t7 1
	mul $v0, $t7, 4
	move $t0 $v0
	add $v0, $s5, $t0
	move $s0 $v0
	lw $t9 0($s0)
	lw $t5 0($t9)
	li $s4 1
	slt $v0, $s6, $t5
	move $t2 $v0
	sub $v0, $s4, $t2
	move $t4 $v0
	beqz $t4 L41
	li $v0, 4
	la $a0, str_er
	syscall
L41:
	nop
	li $s3 4
	move $t8 $s3
	add $v0, $s6, $t8
	move $t1 $v0
	move $t6 $t1
	add $v0, $t9, $t6
	move $s2 $v0
	li $s1 2
	sw $s1, 0($s2)
	li $t3 1
	mul $v0, $t3, 4
	move $s7 $v0
	add $v0, $s5, $s7
	move $t7 $v0
	lw $t0 0($t7)
	li $s0 5
	mul $v0, $s0, 4
	move $t5 $v0
	li $s4 1
	mul $v0, $s4, 4
	move $s7 $v0
	add $v0, $s5, $s7
	move $t2 $v0
	lw $t0 0($t2)
	lw $t4 0($t0)
	li $s3 1
	slt $v0, $t5, $t4
	move $s6 $v0
	sub $v0, $s3, $s6
	move $t8 $v0
	beqz $t8 L42
	li $v0, 4
	la $a0, str_er
	syscall
L42:
	nop
	li $t1 4
	move $t9 $t1
	add $v0, $t5, $t9
	move $t6 $v0
	move $s2 $t6
	add $v0, $t0, $s2
	move $s1 $v0
	li $t3 11
	sw $t3, 0($s1)
	li $t7 1
	mul $v0, $t7, 4
	move $s0 $v0
	add $v0, $s5, $s0
	move $s4 $v0
	lw $s7 0($s4)
	li $t2 6
	mul $v0, $t2, 4
	move $t4 $v0
	li $s3 1
	mul $v0, $s3, 4
	move $s0 $v0
	add $v0, $s5, $s0
	move $s6 $v0
	lw $s7 0($s6)
	lw $t8 0($s7)
	li $t1 1
	slt $v0, $t4, $t8
	move $t5 $v0
	sub $v0, $t1, $t5
	move $t9 $v0
	beqz $t9 L43
	li $v0, 4
	la $a0, str_er
	syscall
L43:
	nop
	li $t6 4
	move $t0 $t6
	add $v0, $t4, $t0
	move $s2 $v0
	move $s1 $s2
	add $v0, $s7, $s1
	move $t3 $v0
	li $t7 6
	sw $t7, 0($t3)
	li $s4 1
	mul $v0, $s4, 4
	move $t2 $v0
	add $v0, $s5, $t2
	move $s3 $v0
	lw $s0 0($s3)
	li $s6 7
	mul $v0, $s6, 4
	move $t8 $v0
	li $t1 1
	mul $v0, $t1, 4
	move $t2 $v0
	add $v0, $s5, $t2
	move $t5 $v0
	lw $s0 0($t5)
	lw $t9 0($s0)
	li $t6 1
	slt $v0, $t8, $t9
	move $t4 $v0
	sub $v0, $t6, $t4
	move $t0 $v0
	beqz $t0 L44
	li $v0, 4
	la $a0, str_er
	syscall
L44:
	nop
	li $s2 4
	move $s7 $s2
	add $v0, $t8, $s7
	move $s1 $v0
	move $t3 $s1
	add $v0, $s0, $t3
	move $t7 $v0
	li $s4 9
	sw $s4, 0($t7)
	li $s3 1
	mul $v0, $s3, 4
	move $s6 $v0
	add $v0, $s5, $s6
	move $t1 $v0
	lw $t2 0($t1)
	li $t5 8
	mul $v0, $t5, 4
	move $t9 $v0
	li $t6 1
	mul $v0, $t6, 4
	move $s6 $v0
	add $v0, $s5, $s6
	move $t4 $v0
	lw $t2 0($t4)
	lw $t0 0($t2)
	li $s2 1
	slt $v0, $t9, $t0
	move $t8 $v0
	sub $v0, $s2, $t8
	move $s7 $v0
	beqz $s7 L45
	li $v0, 4
	la $a0, str_er
	syscall
L45:
	nop
	li $s1 4
	move $s0 $s1
	add $v0, $t9, $s0
	move $t3 $v0
	move $t7 $t3
	add $v0, $t2, $t7
	move $s4 $v0
	li $s3 19
	sw $s3, 0($s4)
	li $t1 1
	mul $v0, $t1, 4
	move $t5 $v0
	add $v0, $s5, $t5
	move $t6 $v0
	lw $s6 0($t6)
	li $t4 9
	mul $v0, $t4, 4
	move $t0 $v0
	li $s2 1
	mul $v0, $s2, 4
	move $t5 $v0
	add $v0, $s5, $t5
	move $t8 $v0
	lw $s6 0($t8)
	lw $s7 0($s6)
	li $s1 1
	slt $v0, $t0, $s7
	move $t9 $v0
	sub $v0, $s1, $t9
	move $s0 $v0
	beqz $s0 L46
	li $v0, 4
	la $a0, str_er
	syscall
L46:
	nop
	li $t3 4
	move $t2 $t3
	add $v0, $t0, $t2
	move $t7 $v0
	move $s4 $t7
	add $v0, $s6, $s4
	move $s3 $v0
	li $t1 5
	sw $t1, 0($s3)
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
