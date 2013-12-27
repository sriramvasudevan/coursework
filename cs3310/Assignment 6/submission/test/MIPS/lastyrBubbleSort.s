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
	la $s2 BBS_Init
	sw $s2, 12($s0)
	la $s3 BBS_Print
	sw $s3, 8($s0)
	la $s4 BBS_Sort
	sw $s4, 4($s0)
	la $s5 BBS_Start
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
	.globl BBS_Start
BBS_Start:
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
	move $t9 $a1
	move $t8 $s2
	lw $s3 0($t8)
	lw $s4 12($s3)
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
	move $t0 $s2
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
	li $s0 99999
	move $a0 $s0
	jal _print
	move $s1 $s2
	lw $t4 0($s1)
	lw $t3 4($t4)
	move $a0 $s1
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
	move $t5 $v0
	move $s7 $t5
	move $t6 $s2
	lw $t7 0($t6)
	lw $s3 8($t7)
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
	move $t8 $v0
	move $s7 $t8
	li $t9 0
	move $v0 $t9
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
	.globl BBS_Sort
BBS_Sort:
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
	move $s4 $a0
	lw $s5 8($s4)
	li $s7 1
	sub $v0, $s5, $s7
	move $t1 $v0
	li $t0 0
	sub $v0, $t0, 1
	move $t2 $v0
L6:
	nop
	slt $v0, $t2, $t1
	move $s6 $v0
	beqz $s6 L17
	li $s0 1
L7:
	nop
	li $t4 1
	add $v0, $t1, $t4
	move $s1 $v0
	slt $v0, $s0, $s1
	move $t3 $v0
	beqz $t3 L16
	sub $v0, $s0, 1
	move $t5 $v0
	lw $s2 4($s4)
	mul $v0, $t5, 4
	move $t7 $v0
	lw $s2 4($s4)
	lw $t6 0($s2)
	li $s3 1
	slt $v0, $t7, $t6
	move $t8 $v0
	sub $v0, $s3, $t8
	move $t9 $v0
	beqz $t9 L8
	li $v0, 4
	la $a0, str_er
	syscall
L8:
	nop
	li $s5 4
	move $s7 $s5
	add $v0, $t7, $s7
	move $t0 $v0
	move $s6 $t0
	add $v0, $s2, $s6
	move $t4 $v0
	lw $s1 0($t4)
	move $t3 $s1
	lw $t5 4($s4)
	mul $v0, $s0, 4
	move $t6 $v0
	lw $t5 4($s4)
	lw $s3 0($t5)
	li $t8 1
	slt $v0, $t6, $s3
	move $t9 $v0
	sub $v0, $t8, $t9
	move $s5 $v0
	beqz $s5 L9
	li $v0, 4
	la $a0, str_er
	syscall
L9:
	nop
	li $t7 4
	move $s7 $t7
	add $v0, $t6, $s7
	move $t0 $v0
	move $s2 $t0
	add $v0, $t5, $s2
	move $s6 $v0
	lw $t4 0($s6)
	move $s1 $t4
	slt $v0, $s1, $t3
	move $s3 $v0
	beqz $s3 L14
	sub $v0, $s0, 1
	move $t8 $v0
	lw $t9 4($s4)
	mul $v0, $t8, 4
	move $s5 $v0
	lw $t9 4($s4)
	lw $t7 0($t9)
	li $t6 1
	slt $v0, $s5, $t7
	move $s7 $v0
	sub $v0, $t6, $s7
	move $t0 $v0
	beqz $t0 L10
	li $v0, 4
	la $a0, str_er
	syscall
L10:
	nop
	li $t5 4
	move $s2 $t5
	add $v0, $s5, $s2
	move $s6 $v0
	move $t4 $s6
	add $v0, $t9, $t4
	move $t3 $v0
	lw $s1 0($t3)
	move $s3 $s1
	li $t7 1
	mul $v0, $t7, 4
	move $t6 $v0
	add $v0, $s4, $t6
	move $s7 $v0
	lw $t0 0($s7)
	mul $v0, $t8, 4
	move $t5 $v0
	li $s5 1
	mul $v0, $s5, 4
	move $t6 $v0
	add $v0, $s4, $t6
	move $s2 $v0
	lw $t0 0($s2)
	lw $s6 0($t0)
	li $t9 1
	slt $v0, $t5, $s6
	move $t4 $v0
	sub $v0, $t9, $t4
	move $t3 $v0
	beqz $t3 L11
	li $v0, 4
	la $a0, str_er
	syscall
L11:
	nop
	li $s1 4
	move $t7 $s1
	add $v0, $t5, $t7
	move $s7 $v0
	move $t8 $s7
	add $v0, $t0, $t8
	move $s5 $v0
	lw $t6 4($s4)
	mul $v0, $s0, 4
	move $s2 $v0
	lw $t6 4($s4)
	lw $s6 0($t6)
	li $t9 1
	slt $v0, $s2, $s6
	move $t4 $v0
	sub $v0, $t9, $t4
	move $t3 $v0
	beqz $t3 L12
	li $v0, 4
	la $a0, str_er
	syscall
L12:
	nop
	li $s1 4
	move $t5 $s1
	add $v0, $s2, $t5
	move $t7 $v0
	move $s7 $t7
	add $v0, $t6, $s7
	move $t0 $v0
	lw $t8 0($t0)
	sw $t8, 0($s5)
	li $s6 1
	mul $v0, $s6, 4
	move $t9 $v0
	add $v0, $s4, $t9
	move $t4 $v0
	lw $t3 0($t4)
	mul $v0, $s0, 4
	move $s1 $v0
	li $s2 1
	mul $v0, $s2, 4
	move $t9 $v0
	add $v0, $s4, $t9
	move $t5 $v0
	lw $t3 0($t5)
	lw $t7 0($t3)
	li $t6 1
	slt $v0, $s1, $t7
	move $s7 $v0
	sub $v0, $t6, $s7
	move $t0 $v0
	beqz $t0 L13
	li $v0, 4
	la $a0, str_er
	syscall
L13:
	nop
	li $s5 4
	move $t8 $s5
	add $v0, $s1, $t8
	move $s6 $v0
	move $t4 $s6
	add $v0, $t3, $t4
	move $s2 $v0
	sw $s3, 0($s2)
	b L15
L14:
	nop
	li $t9 0
L15:
	nop
	add $v0, $s0, 1
	move $s0 $v0
	b L7
L16:
	nop
	sub $v0, $t1, 1
	move $t1 $v0
	b L6
L17:
	nop
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
	lw $fp, 496($sp)
	addu $sp, $sp, 504
	j $ra

	.text
	.globl BBS_Print
BBS_Print:
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
	move $t6 $a0
	li $t7 0
L18:
	nop
	lw $s7 8($t6)
	slt $v0, $t7, $s7
	move $t0 $v0
	beqz $t0 L20
	lw $s5 4($t6)
	mul $v0, $t7, 4
	move $s1 $v0
	lw $s5 4($t6)
	lw $t8 0($s5)
	li $s6 1
	slt $v0, $s1, $t8
	move $t3 $v0
	sub $v0, $s6, $t3
	move $t4 $v0
	beqz $t4 L19
	li $v0, 4
	la $a0, str_er
	syscall
L19:
	nop
	li $s3 4
	move $s2 $s3
	add $v0, $s1, $s2
	move $t9 $v0
	move $s0 $t9
	add $v0, $s5, $s0
	move $s4 $v0
	lw $t1 0($s4)
	move $a0 $t1
	jal _print
	add $v0, $t7, 1
	move $t7 $v0
	b L18
L20:
	nop
	li $t2 0
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
	.globl BBS_Init
BBS_Init:
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
	move $s7 $a0
	move $t5 $a1
	sw $t5, 8($s7)
	add $v0, $t5, 1
	move $t0 $v0
	li $t8 4
	mul $v0, $t0, $t8
	move $s6 $v0
	move $a0 $s6
	jal _halloc
	move $v0 $v0
	move $t3 $v0
	li $t4 4
L21:
	nop
	li $s3 1
	add $v0, $t5, $s3
	move $s1 $v0
	li $s2 4
	move $t9 $s2
	mul $v0, $s1, $t9
	move $s5 $v0
	slt $v0, $t4, $s5
	move $s0 $v0
	beqz $s0 L22
	add $v0, $t3, $t4
	move $s4 $v0
	li $t1 0
	sw $t1, 0($s4)
	add $v0, $t4, 4
	move $t4 $v0
	b L21
L22:
	nop
	li $t7 4
	mul $v0, $t5, $t7
	move $t6 $v0
	sw $t6, 0($t3)
	sw $t3, 4($s7)
	li $t2 1
	mul $v0, $t2, 4
	move $t0 $v0
	add $v0, $s7, $t0
	move $t8 $v0
	lw $s6 0($t8)
	li $s3 0
	mul $v0, $s3, 4
	move $s2 $v0
	li $s1 1
	mul $v0, $s1, 4
	move $t0 $v0
	add $v0, $s7, $t0
	move $t9 $v0
	lw $s6 0($t9)
	lw $s5 0($s6)
	li $s0 1
	slt $v0, $s2, $s5
	move $s4 $v0
	sub $v0, $s0, $s4
	move $t1 $v0
	beqz $t1 L23
	li $v0, 4
	la $a0, str_er
	syscall
L23:
	nop
	li $t4 4
	move $t5 $t4
	add $v0, $s2, $t5
	move $t7 $v0
	move $t6 $t7
	add $v0, $s6, $t6
	move $t3 $v0
	li $t2 20
	sw $t2, 0($t3)
	li $t8 1
	mul $v0, $t8, 4
	move $s3 $v0
	add $v0, $s7, $s3
	move $s1 $v0
	lw $t0 0($s1)
	li $t9 1
	mul $v0, $t9, 4
	move $s5 $v0
	li $s0 1
	mul $v0, $s0, 4
	move $s3 $v0
	add $v0, $s7, $s3
	move $s4 $v0
	lw $t0 0($s4)
	lw $t1 0($t0)
	li $t4 1
	slt $v0, $s5, $t1
	move $s2 $v0
	sub $v0, $t4, $s2
	move $t5 $v0
	beqz $t5 L24
	li $v0, 4
	la $a0, str_er
	syscall
L24:
	nop
	li $t7 4
	move $s6 $t7
	add $v0, $s5, $s6
	move $t6 $v0
	move $t3 $t6
	add $v0, $t0, $t3
	move $t2 $v0
	li $t8 7
	sw $t8, 0($t2)
	li $s1 1
	mul $v0, $s1, 4
	move $t9 $v0
	add $v0, $s7, $t9
	move $s0 $v0
	lw $s3 0($s0)
	li $s4 2
	mul $v0, $s4, 4
	move $t1 $v0
	li $t4 1
	mul $v0, $t4, 4
	move $t9 $v0
	add $v0, $s7, $t9
	move $s2 $v0
	lw $s3 0($s2)
	lw $t5 0($s3)
	li $t7 1
	slt $v0, $t1, $t5
	move $s5 $v0
	sub $v0, $t7, $s5
	move $s6 $v0
	beqz $s6 L25
	li $v0, 4
	la $a0, str_er
	syscall
L25:
	nop
	li $t6 4
	move $t0 $t6
	add $v0, $t1, $t0
	move $t3 $v0
	move $t2 $t3
	add $v0, $s3, $t2
	move $t8 $v0
	li $s1 12
	sw $s1, 0($t8)
	li $s0 1
	mul $v0, $s0, 4
	move $s4 $v0
	add $v0, $s7, $s4
	move $t4 $v0
	lw $t9 0($t4)
	li $s2 3
	mul $v0, $s2, 4
	move $t5 $v0
	li $t7 1
	mul $v0, $t7, 4
	move $s4 $v0
	add $v0, $s7, $s4
	move $s5 $v0
	lw $t9 0($s5)
	lw $s6 0($t9)
	li $t6 1
	slt $v0, $t5, $s6
	move $t1 $v0
	sub $v0, $t6, $t1
	move $t0 $v0
	beqz $t0 L26
	li $v0, 4
	la $a0, str_er
	syscall
L26:
	nop
	li $t3 4
	move $s3 $t3
	add $v0, $t5, $s3
	move $t2 $v0
	move $t8 $t2
	add $v0, $t9, $t8
	move $s1 $v0
	li $s0 18
	sw $s0, 0($s1)
	li $t4 1
	mul $v0, $t4, 4
	move $s2 $v0
	add $v0, $s7, $s2
	move $t7 $v0
	lw $s4 0($t7)
	li $s5 4
	mul $v0, $s5, 4
	move $s6 $v0
	li $t6 1
	mul $v0, $t6, 4
	move $s2 $v0
	add $v0, $s7, $s2
	move $t1 $v0
	lw $s4 0($t1)
	lw $t0 0($s4)
	li $t3 1
	slt $v0, $s6, $t0
	move $t5 $v0
	sub $v0, $t3, $t5
	move $s3 $v0
	beqz $s3 L27
	li $v0, 4
	la $a0, str_er
	syscall
L27:
	nop
	li $t2 4
	move $t9 $t2
	add $v0, $s6, $t9
	move $t8 $v0
	move $s1 $t8
	add $v0, $s4, $s1
	move $s0 $v0
	li $t4 2
	sw $t4, 0($s0)
	li $t7 1
	mul $v0, $t7, 4
	move $s5 $v0
	add $v0, $s7, $s5
	move $t6 $v0
	lw $s2 0($t6)
	li $t1 5
	mul $v0, $t1, 4
	move $t0 $v0
	li $t3 1
	mul $v0, $t3, 4
	move $s5 $v0
	add $v0, $s7, $s5
	move $t5 $v0
	lw $s2 0($t5)
	lw $s3 0($s2)
	li $t2 1
	slt $v0, $t0, $s3
	move $s6 $v0
	sub $v0, $t2, $s6
	move $t9 $v0
	beqz $t9 L28
	li $v0, 4
	la $a0, str_er
	syscall
L28:
	nop
	li $t8 4
	move $s4 $t8
	add $v0, $t0, $s4
	move $s1 $v0
	move $s0 $s1
	add $v0, $s2, $s0
	move $t4 $v0
	li $t7 11
	sw $t7, 0($t4)
	li $t6 1
	mul $v0, $t6, 4
	move $t1 $v0
	add $v0, $s7, $t1
	move $t3 $v0
	lw $s5 0($t3)
	li $t5 6
	mul $v0, $t5, 4
	move $s3 $v0
	li $t2 1
	mul $v0, $t2, 4
	move $t1 $v0
	add $v0, $s7, $t1
	move $s6 $v0
	lw $s5 0($s6)
	lw $t9 0($s5)
	li $t8 1
	slt $v0, $s3, $t9
	move $t0 $v0
	sub $v0, $t8, $t0
	move $s4 $v0
	beqz $s4 L29
	li $v0, 4
	la $a0, str_er
	syscall
L29:
	nop
	li $s1 4
	move $s2 $s1
	add $v0, $s3, $s2
	move $s0 $v0
	move $t4 $s0
	add $v0, $s5, $t4
	move $t7 $v0
	li $t6 6
	sw $t6, 0($t7)
	li $t3 1
	mul $v0, $t3, 4
	move $t5 $v0
	add $v0, $s7, $t5
	move $t2 $v0
	lw $t1 0($t2)
	li $s6 7
	mul $v0, $s6, 4
	move $t9 $v0
	li $t8 1
	mul $v0, $t8, 4
	move $t5 $v0
	add $v0, $s7, $t5
	move $t0 $v0
	lw $t1 0($t0)
	lw $s4 0($t1)
	li $s1 1
	slt $v0, $t9, $s4
	move $s3 $v0
	sub $v0, $s1, $s3
	move $s2 $v0
	beqz $s2 L30
	li $v0, 4
	la $a0, str_er
	syscall
L30:
	nop
	li $s0 4
	move $s5 $s0
	add $v0, $t9, $s5
	move $t4 $v0
	move $t7 $t4
	add $v0, $t1, $t7
	move $t6 $v0
	li $t3 9
	sw $t3, 0($t6)
	li $t2 1
	mul $v0, $t2, 4
	move $s6 $v0
	add $v0, $s7, $s6
	move $t8 $v0
	lw $t5 0($t8)
	li $t0 8
	mul $v0, $t0, 4
	move $s4 $v0
	li $s1 1
	mul $v0, $s1, 4
	move $s6 $v0
	add $v0, $s7, $s6
	move $s3 $v0
	lw $t5 0($s3)
	lw $s2 0($t5)
	li $s0 1
	slt $v0, $s4, $s2
	move $t9 $v0
	sub $v0, $s0, $t9
	move $s5 $v0
	beqz $s5 L31
	li $v0, 4
	la $a0, str_er
	syscall
L31:
	nop
	li $t4 4
	move $t1 $t4
	add $v0, $s4, $t1
	move $t7 $v0
	move $t6 $t7
	add $v0, $t5, $t6
	move $t3 $v0
	li $t2 19
	sw $t2, 0($t3)
	li $t8 1
	mul $v0, $t8, 4
	move $t0 $v0
	add $v0, $s7, $t0
	move $s1 $v0
	lw $s6 0($s1)
	li $s3 9
	mul $v0, $s3, 4
	move $s2 $v0
	li $s0 1
	mul $v0, $s0, 4
	move $t0 $v0
	add $v0, $s7, $t0
	move $t9 $v0
	lw $s6 0($t9)
	lw $s5 0($s6)
	li $t4 1
	slt $v0, $s2, $s5
	move $s4 $v0
	sub $v0, $t4, $s4
	move $t1 $v0
	beqz $t1 L32
	li $v0, 4
	la $a0, str_er
	syscall
L32:
	nop
	li $t7 4
	move $t5 $t7
	add $v0, $s2, $t5
	move $t6 $v0
	move $t3 $t6
	add $v0, $s6, $t3
	move $t2 $v0
	li $t8 5
	sw $t8, 0($t2)
	li $s1 0
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
