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
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s1 $v0
	la $s2 Finder_Find
	sw $s2, 0($s0)
	sw $s0, 0($s1)
	move $s3 $s1
	lw $s4 0($s3)
	lw $s5 0($s4)
	li $s6 1
	move $a0 $s3
	move $a1 $s6
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
	move $a0 $s7
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 104
	j $ra

	.text
	.globl Finder_Find
Finder_Find:
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
	move $t1 $a1
	move $t0 $t1
	li $t2 1
	add $v0, $t2, $t0
	move $t3 $v0
	move $t4 $t3
	li $t5 1
	add $v0, $t5, $t4
	move $t6 $v0
	move $t7 $t6
	li $t8 1
	add $v0, $t8, $t7
	move $t9 $v0
	move $s2 $t9
	li $s0 1
	add $v0, $s0, $s2
	move $s1 $v0
	move $s4 $s1
	li $s3 1
	add $v0, $s3, $s4
	move $s5 $v0
	move $s6 $s5
	li $s7 1
	add $v0, $s7, $s6
	move $t1 $v0
	move $t0 $t1
	li $t2 1
	add $v0, $t2, $t0
	move $t3 $v0
	move $t4 $t3
	li $t5 1
	add $v0, $t5, $t4
	move $t6 $v0
	move $t7 $t6
	li $t8 1
	add $v0, $t8, $t7
	move $t9 $v0
	move $s2 $t9
	li $s0 1
	add $v0, $s0, $s2
	move $s1 $v0
	move $s4 $s1
	li $s3 1
	add $v0, $s3, $s4
	move $s5 $v0
	move $s6 $s5
	li $s7 1
	add $v0, $s7, $s6
	move $t1 $v0
	move $t0 $t1
	li $t2 1
	add $v0, $t2, $t0
	move $t3 $v0
	move $t4 $t3
	li $t5 1
	add $v0, $t5, $t4
	move $t6 $v0
	move $t7 $t6
	li $t8 1
	add $v0, $t8, $t7
	move $t9 $v0
	move $s2 $t9
	li $s0 1
	add $v0, $s0, $s2
	move $s1 $v0
	move $s4 $s1
	li $s3 1
	add $v0, $s3, $s4
	move $s5 $v0
	move $s6 $s5
	li $s7 1
	add $v0, $s7, $s6
	move $t1 $v0
	move $t0 $t1
	li $t2 1
	add $v0, $t2, $t0
	move $t3 $v0
	move $t4 $t3
	li $t5 1
	add $v0, $t5, $t4
	move $t6 $v0
	move $t7 $t6
	li $t8 1
	add $v0, $t8, $t7
	move $t9 $v0
	move $s2 $t9
	li $s0 1
	add $v0, $s0, $s2
	move $s1 $v0
	move $s4 $s1
	li $s3 1
	add $v0, $s3, $s4
	move $s5 $v0
	move $s6 $s5
	li $s7 1
	add $v0, $s7, $s6
	move $t1 $v0
	move $t0 $t1
	li $t2 1
	add $v0, $t2, $t0
	move $t3 $v0
	move $t4 $t3
	li $t5 1
	add $v0, $t5, $t4
	move $t6 $v0
	move $t7 $t6
	li $t8 1
	add $v0, $t8, $t7
	move $t9 $v0
	move $s2 $t9
	li $s0 1
	add $v0, $s0, $s2
	move $s1 $v0
	move $s4 $s1
	li $s3 1
	add $v0, $s3, $s4
	move $s5 $v0
	move $s6 $s5
	li $s7 1
	add $v0, $s7, $s6
	move $t1 $v0
	move $t0 $t1
	li $t2 1
	add $v0, $t2, $t0
	move $t3 $v0
	move $t4 $t3
	li $t5 1
	add $v0, $t5, $t4
	move $t6 $v0
	move $t7 $t6
	li $t8 1
	add $v0, $t8, $t7
	move $t9 $v0
	move $s2 $t9
	li $s0 1
	add $v0, $s0, $s2
	move $s1 $v0
	move $s4 $s1
	li $s3 1
	add $v0, $s3, $s4
	move $s5 $v0
	move $s6 $s5
	li $s7 1
	add $v0, $s7, $s6
	move $t1 $v0
	move $t0 $t1
	li $t2 1
	add $v0, $t2, $t0
	move $t3 $v0
	move $t4 $t3
	li $t5 1
	add $v0, $t5, $t4
	move $t6 $v0
	move $t7 $t6
	li $t8 1
	add $v0, $t8, $t7
	move $t9 $v0
	move $s2 $t9
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
