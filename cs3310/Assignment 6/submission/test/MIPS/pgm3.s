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
	jalr Create_somename
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
	li $s6 5
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
	.globl Create_somename
Create_somename:
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
	move $t3 $v0
	move $t4 $t3
	move $t5 $t4
	la $t6 somename_foo
	sw $t6, 0($t5)
	li $a0 12
	jal _halloc
	move $v0 $v0
	move $t7 $v0
	move $t8 $t7
	move $t9 $t8
	move $s0 $t4
	sw $s0, 0($t9)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s2 $v0
	move $s3 $s2
	li $s3 0
	move $s4 $t8
	move $s1 $s3
	sw $s1, 4($s4)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s6 $v0
	move $s5 $s6
	li $s5 0
	move $s7 $t8
	move $t0 $s5
	sw $t0, 8($s7)
	move $v0 $t8
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
	.globl somename_foo
somename_foo:
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
	move $t1 $t2
	li $t5 1
	add $v0, $t5, $t1
	move $t6 $v0
	li $t7 4
	mul $v0, $t7, $t6
	move $t4 $v0
	move $a0 $t4
	jal _halloc
	move $v0 $v0
	move $t9 $v0
	move $s0 $t9
	move $s2 $s0
	move $s3 $t1
	sw $s3, 0($s2)
	li $s4 0
L2:
	move $s1 $s4
	slt $v0, $s1, $t1
	move $s6 $v0
	move $s5 $s6
	beqz $s5 L3
	li $s7 1
	add $v0, $s7, $s4
	move $t0 $v0
	move $t8 $t0
	li $t2 4
	mul $v0, $t2, $t8
	move $t5 $v0
	move $t6 $t5
	move $t7 $s0
	add $v0, $t7, $t6
	move $t4 $v0
	move $t9 $t4
	move $s2 $t9
	li $s3 0
	sw $s3, 0($s2)
	move $s1 $s4
	add $v0, $s1, 1
	move $s6 $v0
	move $s4 $s6
	b L2
L3:
	nop
	move $s5 $s0
	move $s7 $t3
	move $t0 $s5
	sw $t0, 8($s7)
	move $t8 $t3
	lw $t2 4($t8)
	li $t5 1
	add $v0, $t5, $t2
	move $t6 $v0
	move $t7 $t6
	move $t4 $t3
	lw $t9 8($t4)
	move $s2 $t9
	move $s3 $t3
	lw $s1 4($s3)
	li $s6 1
	add $v0, $s6, $s1
	move $t1 $v0
	move $s4 $t1
	li $s0 4
	mul $v0, $s0, $s4
	move $s5 $v0
	move $s7 $s5
	move $t0 $s2
	add $v0, $t0, $s7
	move $t8 $v0
	move $t2 $t8
	move $t5 $t2
	lw $t6 0($t5)
	move $t4 $t6
	li $t9 4
	mul $v0, $t9, $t7
	move $s3 $v0
	move $s1 $s3
	move $s6 $t3
	lw $t1 8($s6)
	move $s4 $t1
	add $v0, $s4, $s1
	move $s0 $v0
	move $s5 $s0
	move $s2 $s5
	move $s7 $t4
	sw $s7, 0($s2)
	move $t0 $t3
	move $t8 $t1
	sw $t8, 8($t0)
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
