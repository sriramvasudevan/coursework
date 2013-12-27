	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 100
	sw $ra, -4($fp)
	li $a0 1
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 100
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
	li $s0 10
	add $v0, $s0, 1
	move $s1 $v0
	mul $v0, $s1, 4
	move $s2 $v0
	move $a0 $s2
	jal _halloc
	move $v0 $v0
	move $s3 $v0
	move $s4 $s3
	li $s5 4
L0:
	nop
	add $v0, $s0, 1
	move $s6 $v0
	mul $v0, $s6, 4
	move $s7 $v0
	slt $v0, $s5, $s7
	move $t0 $v0
	beqz $t0 L1
	add $v0, $s4, $s5
	move $t1 $v0
	li $t2 0
	sw $t2, 0($t1)
	add $v0, $s5, 4
	move $t3 $v0
	move $s5 $t3
	b L0
L1:
	nop
	sw $s0, 0($s4)
	move $t4 $s4
	li $t5 0
	move $t6 $t4
	li $t7 0
	slt $v0, $t7, 0
	move $t8 $v0
	beqz $t8 L2
	li $v0, 4
	la $a0, str_er
	syscall
L2:
	nop
	lw $t9 0($t6)
	slt $v0, $t7, $t9
	move $s1 $v0
	li $s2 1
	sub $v0, $s2, $s1
	move $s3 $v0
	beqz $s3 L3
	li $v0, 4
	la $a0, str_er
	syscall
L3:
	nop
	li $s6 4
	mul $v0, $s6, $t7
	move $s7 $v0
	move $t7 $s7
	add $v0, $t7, 4
	move $t0 $v0
	add $v0, $t6, $t0
	move $t1 $v0
	sw $t5, 0($t1)
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
