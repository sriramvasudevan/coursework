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
	jalr Create_Fac
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
	.globl Create_Fac
Create_Fac:
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
	move $t3 $v0
	move $t4 $t3
	move $t5 $t4
	la $t6 Fac_testFac
	sw $t6, 0($t5)
	move $t7 $t4
	la $t8 Fac_ComputeFac
	sw $t8, 4($t7)
	li $a0 12
	jal _halloc
	move $v0 $v0
	move $t9 $v0
	move $s0 $t9
	move $s2 $s0
	move $s3 $t4
	sw $s3, 0($s2)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s4 $v0
	move $s1 $s4
	li $s1 0
	move $s6 $s0
	move $s5 $s1
	sw $s5, 4($s6)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s7 $v0
	move $t0 $s7
	li $t0 0
	move $t1 $s0
	move $t2 $t0
	sw $t2, 8($t1)
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
	.globl Fac_ComputeFac
Fac_ComputeFac:
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
	move $t5 $a0
	move $t6 $a1
	move $t3 $t6
	slt $v0, $t3, 1
	move $t7 $v0
	move $t8 $t7
	beqz $t8 L3
	li $t9 1
	move $t4 $t9
	b L4
L3:
	nop
	move $s2 $t5
	move $s3 $s2
	lw $s4 0($s3)
	move $s1 $s4
	lw $s6 4($s1)
	move $s5 $t6
	sub $v0, $s5, 1
	move $s7 $v0
	move $t0 $s7
	move $t1 $s2
	move $t2 $t0
	move $a0 $t1
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
	move $s0 $v0
	move $t3 $s0
	move $t7 $t6
	mul $v0, $t7, $t3
	move $t8 $v0
	move $t9 $t8
	move $t4 $t9
L4:
	nop
	move $s3 $t4
	move $s4 $t5
	move $s1 $s3
	sw $s1, 8($s4)
	li $s5 1
	move $s7 $t5
	move $s2 $s5
	sw $s2, 8($s7)
	move $t0 $t4
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
	lw $fp, 500($sp)
	addu $sp, $sp, 508
	j $ra

	.text
	.globl Fac_testFac
Fac_testFac:
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
	move $s6 $a0
	move $t1 $s6
	lw $t2 8($t1)
	move $s0 $s6
	lw $t6 4($s0)
	move $t3 $t2
	add $v0, $t3, $t6
	move $t7 $v0
	move $t8 $t7
	move $t9 $s6
	move $s3 $t8
	sw $s3, 8($t9)
	move $s4 $s6
	lw $s1 8($s4)
	move $t5 $s1
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
