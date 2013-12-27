	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 100
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
	jalr Create_Test
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
	move $s6 $s1
	move $a0 $s6
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
	move $s7 $v0
	move $t0 $s7
	move $a0 $t0
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 100
	j $ra

	.text
	.globl Create_Test
Create_Test:
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
	move $t1 $v0
	move $t2 $t1
	move $t3 $t2
	la $t4 Test_start
	sw $t4, 0($t3)
	li $a0 8
	jal _halloc
	move $v0 $v0
	move $t5 $v0
	move $t6 $t5
	move $t7 $t6
	move $t8 $t2
	sw $t8, 0($t7)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t9 $v0
	move $s0 $t9
	li $s0 0
	move $s2 $t6
	move $s3 $s0
	sw $s3, 4($s2)
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
	lw $fp, 496($sp)
	addu $sp, $sp, 504
	j $ra

	.text
	.globl Test_start
Test_start:
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
	li $s1 10
	li $s5 1
	add $v0, $s5, $s1
	move $s6 $v0
	li $s7 4
	mul $v0, $s7, $s6
	move $t0 $v0
	move $a0 $t0
	jal _halloc
	move $v0 $v0
	move $t1 $v0
	move $t3 $t1
	move $t4 $t3
	move $t5 $s1
	sw $t5, 0($t4)
	li $t2 0
L2:
	move $t7 $t2
	slt $v0, $t7, $s1
	move $t8 $v0
	move $t9 $t8
	beqz $t9 L3
	li $s0 1
	add $v0, $s0, $t2
	move $s2 $v0
	move $s3 $s2
	li $t6 4
	mul $v0, $t6, $s3
	move $s5 $v0
	move $s6 $s5
	move $s7 $t3
	add $v0, $s7, $s6
	move $t0 $v0
	move $t1 $t0
	move $t4 $t1
	li $t5 0
	sw $t5, 0($t4)
	move $t7 $t2
	add $v0, $t7, 1
	move $t8 $v0
	move $t2 $t8
	b L2
L3:
	nop
	move $t9 $t3
	move $s0 $s4
	move $s2 $t9
	sw $s2, 4($s0)
	li $s3 1
	add $v0, $s3, 1
	move $t6 $v0
	move $s5 $t6
	li $s6 80
	li $s7 4
	mul $v0, $s7, $s5
	move $t0 $v0
	move $t1 $t0
	move $t4 $s4
	lw $t5 4($t4)
	move $t7 $t5
	add $v0, $t7, $t1
	move $t8 $v0
	move $s1 $t8
	move $t2 $s1
	move $t3 $s6
	sw $t3, 0($t2)
	move $t9 $s4
	move $s0 $t5
	sw $s0, 4($t9)
	li $s2 40
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
