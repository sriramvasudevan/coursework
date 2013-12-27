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
	li $a0 0
	jal _halloc
	move $v0 $v0
	move $s0 $v0
	li $a0 8
	jal _halloc
	move $v0 $v0
	move $s1 $v0
	sw $s0, 0($s1)
	li $s2 0
	sw $s2, 4($s1)
	move $s3 $s1
	li $a0 0
	jal _halloc
	move $v0 $v0
	move $s4 $v0
	li $a0 8
	jal _halloc
	move $v0 $v0
	move $s5 $v0
	sw $s4, 0($s5)
	li $s6 0
	sw $s6, 4($s5)
	move $s7 $s5
	move $s3 $s7
	li $t0 0
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
