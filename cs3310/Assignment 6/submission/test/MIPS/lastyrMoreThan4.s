	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 124
	sw $ra, -4($fp)
	li $a0 8
	jal _halloc
	move $v0 $v0
	move $s0 $v0
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s1 $v0
	la $s2 MT4_Change
	sw $s2, 4($s0)
	la $s3 MT4_Start
	sw $s3, 0($s0)
	sw $s0, 0($s1)
	move $s4 $s1
	lw $s5 0($s4)
	lw $s6 0($s5)
	li $s7 1
	li $t0 2
	li $t1 3
	li $t2 4
	li $t3 5
	li $t4 6
	move $a0 $s4
	move $a1 $s7
	move $a2 $t0
	move $a3 $t1
	sw $t2, 0($sp)
	sw $t3, 4($sp)
	sw $t4, 8($sp)
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
	jalr $s6
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
	move $t5 $v0
	move $a0 $t5
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 124
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
	lw $s2, 0($fp)
	lw $s3, 4($fp)
	lw $s0, 8($fp)
	move $a0 $t7
	jal _print
	move $a0 $t8
	jal _print
	move $a0 $t9
	jal _print
	move $a0 $s2
	jal _print
	move $a0 $s3
	jal _print
	move $a0 $s0
	jal _print
	move $s1 $t6
	lw $s5 0($s1)
	lw $s4 4($s5)
	move $a0 $s1
	move $a1 $s0
	move $a2 $s3
	move $a3 $s2
	sw $t9, 0($sp)
	sw $t8, 4($sp)
	sw $t7, 8($sp)
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
	jalr $s4
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
	move $s6 $v0
	move $s7 $s6
	move $v0 $s7
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
	move $t5 $a1
	move $t3 $a2
	move $t4 $a3
	lw $t1, 0($fp)
	lw $t2, 4($fp)
	lw $t0, 8($fp)
	move $a0 $t5
	jal _print
	move $a0 $t3
	jal _print
	move $a0 $t4
	jal _print
	move $a0 $t1
	jal _print
	move $a0 $t2
	jal _print
	move $a0 $t0
	jal _print
	li $t6 0
	move $v0 $t6
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
