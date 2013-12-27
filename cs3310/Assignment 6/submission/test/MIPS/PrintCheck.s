	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 112
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
	jalr Create_Ss
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
	li $s6 10
	li $s7 11
	li $t0 1
	move $t1 $s1
	move $t2 $s6
	move $t3 $s7
	move $t4 $t0
	move $a0 $t1
	move $a1 $t2
	move $a2 $t3
	move $a3 $t4
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
	move $t5 $v0
	move $t6 $t5
	move $a0 $t6
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 112
	j $ra

	.text
	.globl Create_Ss
Create_Ss:
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
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t7 $v0
	move $t8 $t7
	move $t9 $t8
	la $s0 Ss_Compute
	sw $s0, 0($t9)
	li $a0 8
	jal _halloc
	move $v0 $v0
	move $s2 $v0
	move $s3 $s2
	move $s4 $s3
	move $s1 $t8
	sw $s1, 0($s4)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s6 $v0
	move $s7 $s6
	li $s7 0
	move $t0 $s3
	move $s5 $s7
	sw $s5, 4($t0)
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
	.globl Ss_Compute
Ss_Compute:
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
	move $t3 $a0
	move $t2 $a1
	move $t4 $a2
	move $t1 $t2
	add $v0, $t1, $t4
	move $t5 $v0
	move $t6 $t5
	li $t7 1
	add $v0, $t7, $t6
	move $t9 $v0
	li $s0 4
	mul $v0, $s0, $t9
	move $s2 $v0
	move $a0 $s2
	jal _halloc
	move $v0 $v0
	move $t8 $v0
	move $s4 $t8
	move $s1 $s4
	move $s6 $t6
	sw $s6, 0($s1)
	li $s7 0
L2:
	move $t0 $s7
	slt $v0, $t0, $t6
	move $s5 $v0
	move $s3 $s5
	beqz $s3 L3
	li $t2 1
	add $v0, $t2, $s7
	move $t1 $v0
	move $t4 $t1
	li $t5 4
	mul $v0, $t5, $t4
	move $t7 $v0
	move $t9 $t7
	move $s0 $s4
	add $v0, $s0, $t9
	move $s2 $v0
	move $t8 $s2
	move $s1 $t8
	li $s6 0
	sw $s6, 0($s1)
	move $t0 $s7
	add $v0, $t0, 1
	move $s5 $v0
	move $s7 $s5
	b L2
L3:
	nop
	move $s3 $s4
	move $t2 $t3
	move $t1 $s3
	sw $t1, 4($t2)
	move $t4 $t3
	lw $t5 4($t4)
	move $t7 $t5
	move $t9 $t7
	lw $s0 0($t9)
	move $s2 $s0
	move $t8 $s2
	move $s1 $t8
	move $a0 $s1
	jal _print
	move $s6 $t8
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
