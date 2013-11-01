	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 112
	sw $ra, -4($fp)
	li $a0 8
	jal _halloc
	move $v0 $v0
	move $s0 $v0
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s1 $v0
	la $s2 somename_init
	sw $s2, 0($s0)
	la $s3 somename_done
	sw $s3, 4($s0)
	sw $s0, 0($s1)
	move $s4 $s1
	lw $s5 0($s4)
	lw $s6 0($s5)
	li $s7 1
	li $t0 2
	li $t1 3
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
	.globl somename_init
somename_init:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 112
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
	move $t4 $a1
	move $t5 $a2
	move $t6 $a3
	move $t7 $t6
	add $v0, $t7, 1
	move $t8 $v0
	mul $v0, $t8, 4
	move $t9 $v0
	move $a0 $t9
	jal _halloc
	move $v0 $v0
	move $s2 $v0
	move $s3 $s2
	li $s0 4
L2:
	nop
	add $v0, $t7, 1
	move $s1 $v0
	mul $v0, $s1, 4
	move $s5 $v0
	slt $v0, $s0, $s5
	move $s4 $v0
	beqz $s4 L3
	add $v0, $s3, $s0
	move $s6 $v0
	li $s7 0
	sw $s7, 0($s6)
	add $v0, $s0, 4
	move $t0 $v0
	move $s0 $t0
	b L2
L3:
	nop
	sw $t7, 0($s3)
	move $t1 $s3
	move $t2 $t3
	lw $t6 0($t2)
	lw $t8 4($t6)
	move $a0 $t2
	move $a1 $t4
	move $a2 $t5
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
	jalr $t8
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
	move $t9 $v0
	move $s2 $t9
	li $s1 1
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
	lw $fp, 104($sp)
	addu $sp, $sp, 112
	j $ra

	.text
	.globl somename_done
somename_done:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 104
	sw $ra, -4($fp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
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
	lw $fp, 96($sp)
	addu $sp, $sp, 104
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
