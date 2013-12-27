	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 104
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
	li $s7 1
	move $a0 $s4
	move $a1 $s7
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
	move $t0 $v0
	move $a0 $t0
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 104
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
	move $t2 $a0
	li $t1 10
	add $v0, $t1, 1
	move $t3 $v0
	mul $v0, $t3, 4
	move $t4 $v0
	move $a0 $t4
	jal _halloc
	move $v0 $v0
	move $t5 $v0
	move $t6 $t5
	li $t7 4
L1:
	nop
	add $v0, $t1, 1
	move $t8 $v0
	mul $v0, $t8, 4
	move $t9 $v0
	slt $v0, $t7, $t9
	move $s2 $v0
	beqz $s2 L2
	add $v0, $t6, $t7
	move $s0 $v0
	li $s3 0
	sw $s3, 0($s0)
	add $v0, $t7, 4
	move $s1 $v0
	move $t7 $s1
	b L1
L2:
	nop
	sw $t1, 0($t6)
	sw $t6, 4($t2)
	li $s5 2
	lw $s4 4($t2)
	move $s6 $s5
	slt $v0, $s6, 0
	move $s7 $v0
	beqz $s7 L3
	li $v0, 4
	la $a0, str_er
	syscall
L3:
	nop
	lw $t0 0($s4)
	slt $v0, $s6, $t0
	move $t3 $v0
	li $t4 1
	sub $v0, $t4, $t3
	move $t5 $v0
	beqz $t5 L4
	li $v0, 4
	la $a0, str_er
	syscall
L4:
	nop
	li $t8 4
	mul $v0, $t8, $s6
	move $t9 $v0
	move $s6 $t9
	add $v0, $s6, 4
	move $s2 $v0
	add $v0, $s4, $s2
	move $s0 $v0
	add $v0, $s5, $s5
	move $s3 $v0
	sw $s3, 0($s0)
	li $s1 10
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
