	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 124
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
	jalr Create_MT4
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
	lw $s5 0($s4)
	li $s6 1
	li $s7 2
	li $t0 3
	li $t1 4
	li $t2 5
	li $t3 6
	move $t4 $s1
	move $t5 $s6
	move $t6 $s7
	move $t7 $t0
	move $t8 $t1
	move $t9 $t2
	move $s0 $t3
	move $a0 $t4
	move $a1 $t5
	move $a2 $t6
	move $a3 $t7
	sw $t8, 0($sp)
	sw $t9, 4($sp)
	sw $s0, 8($sp)
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
	move $s2 $v0
	move $s3 $s2
	move $a0 $s3
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 124
	j $ra

	.text
	.globl Create_MT4
Create_MT4:
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
	move $s1 $s4
	move $s6 $s1
	la $s7 MT4_Start
	sw $s7, 0($s6)
	move $t0 $s1
	la $t1 MT4_Change
	sw $t1, 4($t0)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t2 $v0
	move $t3 $t2
	move $s5 $t3
	move $t4 $s1
	sw $t4, 0($s5)
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
	.globl MT4_Start
MT4_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 140
	sw $ra, -4($fp)
	sw $s0, 12($sp)
	sw $s1, 16($sp)
	sw $s2, 20($sp)
	sw $s3, 24($sp)
	sw $s4, 28($sp)
	sw $s5, 32($sp)
	sw $s6, 36($sp)
	sw $s7, 40($sp)
	move $t6 $a0
	move $t7 $a1
	move $t8 $a2
	move $t9 $a3
	lw $s0, 0($fp)
	lw $s2, 4($fp)
	lw $s3, 8($fp)
	move $t5 $t7
	move $a0 $t5
	jal _print
	move $s4 $t8
	move $a0 $s4
	jal _print
	move $s6 $t9
	move $a0 $s6
	jal _print
	move $s7 $s0
	move $a0 $s7
	jal _print
	move $t0 $s2
	move $a0 $t0
	jal _print
	move $t1 $s3
	move $a0 $t1
	jal _print
	move $t2 $t6
	move $s1 $t2
	lw $s5 0($s1)
	move $t4 $s5
	lw $t3 4($t4)
	move $t5 $s3
	move $s4 $s2
	move $s6 $s0
	move $s7 $t9
	move $t0 $t8
	move $t1 $t7
	move $t6 $t2
	move $s1 $t5
	move $s5 $s4
	move $t4 $s6
	move $s3 $s7
	move $s2 $t0
	move $s0 $t1
	move $a0 $t6
	move $a1 $s1
	move $a2 $s5
	move $a3 $t4
	sw $s3, 0($sp)
	sw $s2, 4($sp)
	sw $s0, 8($sp)
	sw $t0, 44($sp)
	sw $t1, 48($sp)
	sw $t2, 52($sp)
	sw $t3, 56($sp)
	sw $t4, 60($sp)
	sw $t5, 64($sp)
	sw $t6, 68($sp)
	sw $t7, 72($sp)
	sw $t8, 76($sp)
	sw $t9, 80($sp)
	jalr $t3
	lw $t9, 80($sp)
	lw $t8, 76($sp)
	lw $t7, 72($sp)
	lw $t6, 68($sp)
	lw $t5, 64($sp)
	lw $t4, 60($sp)
	lw $t3, 56($sp)
	lw $t2, 52($sp)
	lw $t1, 48($sp)
	lw $t0, 44($sp)
	move $t9 $v0
	move $t8 $t9
	move $t7 $t8
	move $t2 $t7
	move $v0 $t2
	lw $s7, 40($sp)
	lw $s6, 36($sp)
	lw $s5, 32($sp)
	lw $s4, 28($sp)
	lw $s3, 24($sp)
	lw $s2, 20($sp)
	lw $s1, 16($sp)
	lw $s0, 12($sp)
	lw $ra, -4($fp)
	lw $fp, 132($sp)
	addu $sp, $sp, 140
	j $ra

	.text
	.globl MT4_Change
MT4_Change:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 116
	sw $ra, -4($fp)
	sw $s0, 12($sp)
	sw $s1, 16($sp)
	sw $s2, 20($sp)
	sw $s3, 24($sp)
	sw $s4, 28($sp)
	sw $s5, 32($sp)
	sw $s6, 36($sp)
	sw $s7, 40($sp)
	move $t3 $a1
	move $t0 $a2
	move $t1 $a3
	lw $s6, 0($fp)
	lw $s7, 4($fp)
	lw $t5, 8($fp)
	move $s4 $t3
	move $a0 $s4
	jal _print
	move $t6 $t0
	move $a0 $t6
	jal _print
	move $s1 $t1
	move $a0 $s1
	jal _print
	move $s5 $s6
	move $a0 $s5
	jal _print
	move $t4 $s7
	move $a0 $t4
	jal _print
	move $s3 $t5
	move $a0 $s3
	jal _print
	li $s2 0
	move $v0 $s2
	lw $s7, 40($sp)
	lw $s6, 36($sp)
	lw $s5, 32($sp)
	lw $s4, 28($sp)
	lw $s3, 24($sp)
	lw $s2, 20($sp)
	lw $s1, 16($sp)
	lw $s0, 12($sp)
	lw $ra, -4($fp)
	lw $fp, 108($sp)
	addu $sp, $sp, 116
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
