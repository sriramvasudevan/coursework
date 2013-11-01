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
	jalr Create_LS
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
	.globl Create_LS
Create_LS:
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
	li $a0 16
	jal _halloc
	move $v0 $v0
	move $t3 $v0
	move $t4 $t3
	move $t5 $t4
	la $t6 LS_Search
	sw $t6, 0($t5)
	move $t7 $t4
	la $t8 LS_Start
	sw $t8, 4($t7)
	move $t9 $t4
	la $s0 LS_Init
	sw $s0, 8($t9)
	move $s2 $t4
	la $s3 LS_Print
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
	lw $fp, 96($sp)
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
	move $t9 $a0
	move $t8 $a1
	move $s0 $t9
	move $s2 $s0
	lw $s3 0($s2)
	move $s4 $s3
	lw $t4 8($s4)
	move $s6 $t8
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
	move $t3 $t9
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
	move $t8 $s4
	li $s0 9999
	move $a0 $s0
	jal _print
	move $s6 $t9
	move $t4 $s6
	lw $s5 0($t4)
	move $s7 $s5
	lw $t0 0($s7)
	li $t1 8
	move $t2 $s6
	move $t5 $t1
	move $a0 $t2
	move $a1 $t5
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
	move $t6 $v0
	move $t7 $t6
	move $a0 $t7
	jal _print
	move $t3 $t9
	move $s1 $t3
	lw $s2 0($s1)
	move $s3 $s2
	lw $s4 0($s3)
	li $t8 12
	move $s0 $t3
	move $t4 $t8
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
	move $a0 $s7
	jal _print
	move $s6 $t9
	move $t1 $s6
	lw $t0 0($t1)
	move $t2 $t0
	lw $t5 0($t2)
	li $t6 17
	move $t7 $s6
	move $s1 $t6
	move $a0 $t7
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
	move $s2 $v0
	move $s3 $s2
	move $a0 $s3
	jal _print
	move $t3 $t9
	move $t8 $t3
	lw $s4 0($t8)
	move $s0 $s4
	lw $t4 0($s0)
	li $s5 50
	move $s7 $t3
	move $t1 $s5
	move $a0 $s7
	move $a1 $t1
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
	move $t2 $t0
	move $a0 $t2
	jal _print
	li $s6 55
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
	move $t6 $a0
	li $t5 1
	move $t7 $t5
L5:
	move $s1 $t6
	lw $s2 8($s1)
	move $s3 $s2
	move $t9 $t7
	slt $v0, $t9, $s3
	move $t8 $v0
	move $s4 $t8
	beqz $s4 L6
	move $s0 $t6
	lw $t3 4($s0)
	move $s5 $t3
	li $t4 1
	add $v0, $t4, $t7
	move $s7 $v0
	move $t1 $s7
	li $t0 4
	mul $v0, $t0, $t1
	move $t2 $v0
	move $s6 $t2
	move $t5 $s5
	add $v0, $t5, $s6
	move $s1 $v0
	move $s2 $s1
	move $s3 $s2
	lw $t9 0($s3)
	move $t8 $t9
	move $a0 $t8
	jal _print
	move $s4 $t7
	add $v0, $s4, 1
	move $s0 $v0
	move $t3 $s0
	move $t7 $t3
	b L5
L6:
	nop
	li $t4 0
	move $v0 $t4
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
	move $s7 $a0
	move $t1 $a1
	li $t0 1
	move $t2 $t0
	li $s5 0
	move $s6 $s5
	li $t5 0
	move $s1 $t5
L7:
	move $s2 $s7
	lw $s3 8($s2)
	move $t9 $s3
	move $t8 $t2
	slt $v0, $t8, $t9
	move $s4 $v0
	move $s0 $s4
	beqz $s0 L12
	move $t3 $s7
	lw $t6 4($t3)
	move $t7 $t6
	li $t4 1
	add $v0, $t4, $t2
	move $t0 $v0
	move $s5 $t0
	li $s6 4
	mul $v0, $s6, $s5
	move $t5 $v0
	move $s2 $t5
	move $s3 $t7
	add $v0, $s3, $s2
	move $t9 $v0
	move $t8 $t9
	move $s4 $t8
	lw $s0 0($s4)
	move $t3 $s0
	move $t6 $t3
	move $t4 $t1
	add $v0, $t4, 1
	move $t0 $v0
	move $s5 $t0
	move $s6 $s5
	move $t5 $t6
	slt $v0, $t5, $t1
	move $t7 $v0
	move $s2 $t7
	beqz $s2 L8
	li $s3 0
	move $t9 $s3
	b L11
L8:
	nop
	move $t8 $t6
	slt $v0, $t8, $s6
	move $s4 $v0
	move $s0 $s4
	li $t3 1
	sub $v0, $t3, $s0
	move $t4 $v0
	move $t0 $t4
	beqz $t0 L9
	li $s5 0
	move $t9 $s5
	b L10
L9:
	nop
	li $t5 1
	move $s6 $t5
	li $t7 1
	move $s1 $t7
	move $s2 $s7
	lw $s3 8($s2)
	move $t9 $s3
	move $t2 $t9
L10:
	nop
L11:
	nop
	move $t6 $t2
	add $v0, $t6, 1
	move $s6 $v0
	move $t8 $s6
	move $t2 $t8
	b L7
L12:
	nop
	move $s4 $s1
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
	move $t3 $a0
	move $t4 $a1
	move $s0 $t4
	move $t0 $t3
	move $s5 $s0
	sw $s5, 8($t0)
	move $t5 $t4
	li $t7 1
	add $v0, $t7, $t5
	move $s2 $v0
	li $s3 4
	mul $v0, $s3, $s2
	move $t9 $v0
	move $a0 $t9
	jal _halloc
	move $v0 $v0
	move $t6 $v0
	move $s6 $t6
	move $t8 $s6
	move $s7 $t5
	sw $s7, 0($t8)
	li $t1 0
L13:
	move $t2 $t1
	slt $v0, $t2, $t5
	move $s1 $v0
	move $s4 $s1
	beqz $s4 L14
	li $s0 1
	add $v0, $s0, $t1
	move $t0 $v0
	move $s5 $t0
	li $t4 4
	mul $v0, $t4, $s5
	move $t7 $v0
	move $s2 $t7
	move $s3 $s6
	add $v0, $s3, $s2
	move $t9 $v0
	move $t6 $t9
	move $t8 $t6
	li $s7 0
	sw $s7, 0($t8)
	move $t2 $t1
	add $v0, $t2, 1
	move $s1 $v0
	move $t1 $s1
	b L13
L14:
	nop
	move $s4 $s6
	move $s0 $t3
	move $t0 $s4
	sw $t0, 4($s0)
	li $s5 1
	move $t4 $s5
	move $t7 $t3
	lw $s2 8($t7)
	move $s3 $s2
	add $v0, $s3, 1
	move $t9 $v0
	move $t6 $t9
	move $t8 $t6
L15:
	move $s7 $t3
	lw $t2 8($s7)
	move $s1 $t2
	move $t5 $t4
	slt $v0, $t5, $s1
	move $t1 $v0
	move $s6 $t1
	beqz $s6 L16
	li $s4 2
	mul $v0, $s4, $t4
	move $s0 $v0
	move $t0 $s0
	move $s5 $t0
	move $t7 $t8
	sub $v0, $t7, 3
	move $s2 $v0
	move $s3 $s2
	move $t9 $s3
	li $t6 1
	add $v0, $t6, $t4
	move $s7 $v0
	move $t2 $s7
	move $s1 $s5
	add $v0, $s1, $t9
	move $t5 $v0
	move $t1 $t5
	li $s6 4
	mul $v0, $s6, $t2
	move $s4 $v0
	move $s0 $s4
	move $t0 $t3
	lw $t7 4($t0)
	move $s2 $t7
	add $v0, $s2, $s0
	move $s3 $v0
	move $t6 $s3
	move $s7 $t6
	move $s5 $t1
	sw $s5, 0($s7)
	move $t9 $t3
	move $s1 $t7
	sw $s1, 4($t9)
	move $t5 $t4
	add $v0, $t5, 1
	move $t2 $v0
	move $s6 $t2
	move $t4 $s6
	move $s4 $t8
	sub $v0, $s4, 1
	move $t0 $v0
	move $s0 $t0
	move $t8 $s0
	b L15
L16:
	nop
	li $s2 0
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
