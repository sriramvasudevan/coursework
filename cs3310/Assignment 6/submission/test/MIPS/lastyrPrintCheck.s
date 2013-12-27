	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 112
	sw $ra, -4($fp)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s0 $v0
	li $a0 8
	jal _halloc
	move $v0 $v0
	move $s1 $v0
	la $s2 Ss_Compute
	sw $s2, 0($s0)
	sw $s0, 0($s1)
	li $s3 0
	sw $s3, 4($s1)
	move $s4 $s1
	lw $s5 0($s4)
	lw $s6 0($s5)
	li $s7 10
	li $t0 11
	li $t1 1
	move $a0 $s4
	move $a1 $s7
	move $a2 $t0
	move $a3 $t1
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
	move $t2 $v0
	move $a0 $t2
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 112
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
	move $t4 $a0
	li $t3 15
	add $v0, $t3, 1
	move $t5 $v0
	mul $v0, $t5, 4
	move $t6 $v0
	move $a0 $t6
	jal _halloc
	move $v0 $v0
	move $t7 $v0
	move $t8 $t7
	li $t9 4
L1:
	nop
	add $v0, $t3, 1
	move $s2 $v0
	mul $v0, $s2, 4
	move $s0 $v0
	slt $v0, $t9, $s0
	move $s3 $v0
	beqz $s3 L2
	add $v0, $t8, $t9
	move $s1 $v0
	li $s5 0
	sw $s5, 0($s1)
	add $v0, $t9, 4
	move $s4 $v0
	move $t9 $s4
	b L1
L2:
	nop
	sw $t3, 0($t8)
	sw $t8, 4($t4)
	lw $s6 4($t4)
	move $s7 $s6
	lw $t0 0($s7)
	move $t1 $t0
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
