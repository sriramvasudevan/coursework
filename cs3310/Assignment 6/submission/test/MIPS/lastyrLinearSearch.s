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
	la $s2 LS_Init
	sw $s2, 12($s0)
	la $s3 LS_Search
	sw $s3, 8($s0)
	la $s4 LS_Print
	sw $s4, 4($s0)
	la $s5 LS_Start
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
	.globl LS_Start
LS_Start:
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
	lw $t2 4($t1)
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
	move $s0 $s6
	li $s1 9999
	move $a0 $s1
	jal _print
	move $t4 $s2
	lw $t3 0($t4)
	lw $t5 8($t3)
	li $t6 8
	move $a0 $t4
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
	move $t7 $v0
	move $a0 $t7
	jal _print
	move $s3 $s2
	lw $t8 0($s3)
	lw $t9 8($t8)
	li $s4 12
	move $a0 $s3
	move $a1 $s4
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
	jalr $t9
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
	move $a0 $s5
	jal _print
	move $s7 $s2
	lw $t1 0($s7)
	lw $t0 8($t1)
	li $t2 17
	move $a0 $s7
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
	move $s6 $v0
	move $a0 $s6
	jal _print
	move $s0 $s2
	lw $s1 0($s0)
	lw $t3 8($s1)
	li $t4 50
	move $a0 $s0
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
	move $a0 $t5
	jal _print
	li $t6 55
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
	lw $fp, 100($sp)
	addu $sp, $sp, 108
	j $ra

	.text
	.globl LS_Print
LS_Print:
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
	move $t8 $a0
	li $t7 1
L6:
	nop
	lw $s3 8($t8)
	slt $v0, $t7, $s3
	move $t9 $v0
	beqz $t9 L8
	lw $s4 4($t8)
	mul $v0, $t7, 4
	move $s5 $v0
	lw $s4 4($t8)
	lw $t1 0($s4)
	li $s7 1
	slt $v0, $s5, $t1
	move $t0 $v0
	sub $v0, $s7, $t0
	move $t2 $v0
	beqz $t2 L7
	li $v0, 4
	la $a0, str_er
	syscall
L7:
	nop
	li $s6 4
	move $s2 $s6
	add $v0, $s5, $s2
	move $s1 $v0
	move $s0 $s1
	add $v0, $s4, $s0
	move $t3 $v0
	lw $t4 0($t3)
	move $a0 $t4
	jal _print
	add $v0, $t7, 1
	move $t7 $v0
	b L6
L8:
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
	lw $fp, 96($sp)
	addu $sp, $sp, 104
	j $ra

	.text
	.globl LS_Search
LS_Search:
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
	move $s3 $a0
	move $t9 $a1
	li $t6 1
	li $t1 0
	li $s7 0
L9:
	nop
	lw $t0 8($s3)
	slt $v0, $t6, $t0
	move $t2 $v0
	beqz $t2 L15
	lw $s6 4($s3)
	mul $v0, $t6, 4
	move $s5 $v0
	lw $s6 4($s3)
	lw $s2 0($s6)
	li $s1 1
	slt $v0, $s5, $s2
	move $s4 $v0
	sub $v0, $s1, $s4
	move $s0 $v0
	beqz $s0 L10
	li $v0, 4
	la $a0, str_er
	syscall
L10:
	nop
	li $t3 4
	move $t4 $t3
	add $v0, $s5, $t4
	move $t7 $v0
	move $t8 $t7
	add $v0, $s6, $t8
	move $t5 $v0
	lw $t1 0($t5)
	move $t0 $t1
	add $v0, $t9, 1
	move $t2 $v0
	slt $v0, $t0, $t9
	move $s2 $v0
	beqz $s2 L11
	li $s1 0
	b L14
L11:
	nop
	li $s4 1
	slt $v0, $t0, $t2
	move $s0 $v0
	sub $v0, $s4, $s0
	move $t3 $v0
	beqz $t3 L12
	li $s1 0
	b L13
L12:
	nop
	li $t1 1
	li $s7 1
	lw $s5 8($s3)
	move $t6 $s5
L13:
	nop
L14:
	nop
	add $v0, $t6, 1
	move $t6 $v0
	b L9
L15:
	nop
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
	.globl LS_Init
LS_Init:
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
	move $t4 $a0
	move $t7 $a1
	sw $t7, 8($t4)
	add $v0, $t7, 1
	move $s6 $v0
	li $t8 4
	mul $v0, $s6, $t8
	move $t5 $v0
	move $a0 $t5
	jal _halloc
	move $v0 $v0
	move $t1 $v0
	li $s2 4
L16:
	nop
	li $s1 1
	add $v0, $t7, $s1
	move $t0 $v0
	li $t2 4
	move $s4 $t2
	mul $v0, $t0, $s4
	move $s0 $v0
	slt $v0, $s2, $s0
	move $t3 $v0
	beqz $t3 L17
	add $v0, $t1, $s2
	move $s5 $v0
	li $t6 0
	sw $t6, 0($s5)
	add $v0, $s2, 4
	move $s2 $v0
	b L16
L17:
	nop
	li $s3 4
	mul $v0, $t7, $s3
	move $t9 $v0
	sw $t9, 0($t1)
	sw $t1, 4($t4)
	li $s7 1
	lw $s6 8($t4)
	li $t8 1
	add $v0, $s6, $t8
	move $t5 $v0
L18:
	nop
	lw $s1 8($t4)
	slt $v0, $s7, $s1
	move $t2 $v0
	beqz $t2 L20
	li $t0 2
	mul $v0, $t0, $s7
	move $s4 $v0
	sub $v0, $t5, 3
	move $s0 $v0
	li $t3 1
	mul $v0, $t3, 4
	move $s5 $v0
	add $v0, $t4, $s5
	move $t6 $v0
	lw $s2 0($t6)
	mul $v0, $s7, 4
	move $t7 $v0
	li $s3 1
	mul $v0, $s3, 4
	move $s5 $v0
	add $v0, $t4, $s5
	move $t9 $v0
	lw $s2 0($t9)
	lw $t1 0($s2)
	li $s6 1
	slt $v0, $t7, $t1
	move $t8 $v0
	sub $v0, $s6, $t8
	move $s1 $v0
	beqz $s1 L19
	li $v0, 4
	la $a0, str_er
	syscall
L19:
	nop
	li $t2 4
	move $t0 $t2
	add $v0, $t7, $t0
	move $t3 $v0
	move $t6 $t3
	add $v0, $s2, $t6
	move $s3 $v0
	add $v0, $s4, $s0
	move $s5 $v0
	sw $s5, 0($s3)
	add $v0, $s7, 1
	move $s7 $v0
	sub $v0, $t5, 1
	move $t5 $v0
	b L18
L20:
	nop
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
