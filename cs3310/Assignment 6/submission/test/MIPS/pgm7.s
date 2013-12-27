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
	lw $s5 4($s4)
	li $s6 1
	li $s7 2
	li $t0 3
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
	li $a0 8
	jal _halloc
	move $v0 $v0
	move $t7 $v0
	move $t8 $t7
	move $t9 $t8
	la $s0 somename_done
	sw $s0, 0($t9)
	move $s2 $t8
	la $s3 somename_init
	sw $s3, 4($s2)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s4 $v0
	move $s1 $s4
	move $s6 $s1
	move $s7 $t8
	sw $s7, 0($s6)
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
	.globl somename_init
somename_init:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 512
	sw $ra, -4($fp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	move $s5 $a0
	move $t1 $a1
	move $t2 $a2
	move $t3 $a3
	move $t0 $t3
	li $t4 1
	add $v0, $t4, $t0
	move $t5 $v0
	li $t6 4
	mul $v0, $t6, $t5
	move $t7 $v0
	move $a0 $t7
	jal _halloc
	move $v0 $v0
	move $t9 $v0
	move $s0 $t9
	move $s2 $s0
	move $s3 $t0
	sw $s3, 0($s2)
	li $s4 0
L3:
	move $t8 $s4
	slt $v0, $t8, $t0
	move $s6 $v0
	move $s7 $s6
	beqz $s7 L4
	li $s1 1
	add $v0, $s1, $s4
	move $t3 $v0
	move $t4 $t3
	li $t5 4
	mul $v0, $t5, $t4
	move $t6 $v0
	move $t7 $t6
	move $t9 $s0
	add $v0, $t9, $t7
	move $s2 $v0
	move $s3 $s2
	move $t8 $s3
	li $s6 0
	sw $s6, 0($t8)
	move $s7 $s4
	add $v0, $s7, 1
	move $s1 $v0
	move $s4 $s1
	b L3
L4:
	nop
	move $t3 $s0
	move $t4 $t3
	move $t5 $s5
	move $t6 $t5
	lw $t7 0($t6)
	move $t9 $t7
	lw $s2 0($t9)
	move $s3 $t1
	move $t8 $t2
	move $s6 $t5
	move $s7 $s3
	move $s1 $t8
	move $a0 $s6
	move $a1 $s7
	move $a2 $s1
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
	jalr $s2
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
	move $t0 $v0
	move $s4 $t0
	move $s0 $s4
	li $t3 1
	move $v0 $t3
	lw $s7, 28($sp)
	lw $s6, 24($sp)
	lw $s5, 20($sp)
	lw $s4, 16($sp)
	lw $s3, 12($sp)
	lw $s2, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 504($sp)
	addu $sp, $sp, 512
	j $ra

	.text
	.globl somename_done
somename_done:
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
	li $t4 0
	move $v0 $t4
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
