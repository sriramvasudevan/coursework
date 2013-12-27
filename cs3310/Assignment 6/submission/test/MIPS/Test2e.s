	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 100
	sw $ra, -4($fp)
	li $s0 1
	move $a0 $s0
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 100
	j $ra

	.text
	.globl Create_Finder
Create_Finder:
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
	move $s1 $v0
	move $s2 $s1
	move $s3 $s2
	la $s4 Finder_Find
	sw $s4, 0($s3)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s5 $v0
	move $s6 $s5
	move $s7 $s6
	move $t0 $s2
	sw $t0, 0($s7)
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
	move $t3 $a2
	move $t2 $t3
	sub $v0, $t2, $t1
	move $t4 $v0
	move $t5 $t4
	li $t6 1
	add $v0, $t6, $t5
	move $t7 $v0
	li $t8 4
	mul $v0, $t8, $t7
	move $t9 $v0
	move $a0 $t9
	jal _halloc
	move $v0 $v0
	move $s0 $v0
	move $s1 $s0
	move $s3 $s1
	move $s4 $t5
	sw $s4, 0($s3)
	li $s5 0
L1:
	move $s2 $s5
	slt $v0, $s2, $t5
	move $s7 $v0
	move $t0 $s7
	beqz $t0 L2
	li $s6 1
	add $v0, $s6, $s5
	move $t3 $v0
	move $t1 $t3
	li $t2 4
	mul $v0, $t2, $t1
	move $t4 $v0
	move $t6 $t4
	move $t7 $s1
	add $v0, $t7, $t6
	move $t8 $v0
	move $t9 $t8
	move $s0 $t9
	li $s3 0
	sw $s3, 0($s0)
	move $s4 $s5
	add $v0, $s4, 1
	move $s2 $v0
	move $s5 $s2
	b L1
L2:
	nop
	move $s7 $s1
	move $t0 $s7
	li $s6 20
	move $t3 $s6
	li $t1 1
	add $v0, $t1, 0
	move $t2 $v0
	move $t4 $t2
	move $t6 $t3
	li $t7 4
	mul $v0, $t7, $t4
	move $t8 $v0
	move $t9 $t8
	move $s0 $t0
	add $v0, $s0, $t9
	move $s3 $v0
	move $s4 $s3
	move $s2 $s4
	move $t5 $t6
	sw $t5, 0($s2)
	li $s5 0
	move $v0 $s5
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
