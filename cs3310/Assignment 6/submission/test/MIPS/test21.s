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
	jalr Create_A24
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
	li $s6 0
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
	.globl Create_A24
Create_A24:
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
	move $t3 $v0
	move $t4 $t3
	move $t5 $t4
	la $t6 A24_m1
	sw $t6, 0($t5)
	move $t7 $t4
	la $t8 A24_m2
	sw $t8, 4($t7)
	li $a0 20
	jal _halloc
	move $v0 $v0
	move $t9 $v0
	move $s0 $t9
	move $s2 $s0
	move $s3 $t4
	sw $s3, 0($s2)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s4 $v0
	move $s1 $s4
	li $s1 0
	move $s6 $s0
	move $s5 $s1
	sw $s5, 4($s6)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s7 $v0
	move $t0 $s7
	li $t0 0
	move $t1 $s0
	move $t2 $t0
	sw $t2, 8($t1)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t3 $v0
	move $t5 $t3
	li $t5 0
	move $t6 $s0
	move $t7 $t5
	sw $t7, 12($t6)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t8 $v0
	move $t9 $t8
	li $t9 0
	move $t4 $s0
	move $s2 $t9
	sw $s2, 16($t4)
	move $v0 $s0
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
	.globl A24_m1
A24_m1:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 508
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
	move $s1 $a1
	move $s3 $s1
	beqz $s3 L3
	li $s6 5
	move $s5 $s6
	b L4
L3:
	nop
	li $s7 10
	move $s5 $s7
L4:
	nop
	move $t0 $s5
	li $t1 1
	add $v0, $t1, $t0
	move $t2 $v0
	li $t3 4
	mul $v0, $t3, $t2
	move $t5 $v0
	move $a0 $t5
	jal _halloc
	move $v0 $v0
	move $t6 $v0
	move $t7 $t6
	move $t8 $t7
	move $t9 $t0
	sw $t9, 0($t8)
	li $t4 0
L5:
	move $s2 $t4
	slt $v0, $s2, $t0
	move $s0 $v0
	move $s1 $s0
	beqz $s1 L6
	li $s3 1
	add $v0, $s3, $t4
	move $s6 $v0
	move $s7 $s6
	li $t1 4
	mul $v0, $t1, $s7
	move $t2 $v0
	move $t3 $t2
	move $t5 $t7
	add $v0, $t5, $t3
	move $t6 $v0
	move $t8 $t6
	move $t9 $t8
	li $s2 0
	sw $s2, 0($t9)
	move $s0 $t4
	add $v0, $s0, 1
	move $s1 $v0
	move $t4 $s1
	b L5
L6:
	nop
	move $s3 $t7
	move $s6 $s4
	move $s7 $s3
	sw $s7, 12($s6)
	li $t1 0
	move $s5 $t1
	move $t2 $s4
	lw $t3 12($t2)
	move $t5 $t3
	move $t6 $t5
	lw $t8 0($t6)
	move $t9 $t8
	move $s2 $t9
L7:
	move $s0 $s5
	slt $v0, $s0, $s2
	move $s1 $v0
	move $t0 $s1
	beqz $t0 L8
	li $t4 1
	add $v0, $t4, $s5
	move $t7 $v0
	move $s3 $t7
	move $s6 $s5
	add $v0, $s6, 1
	move $s7 $v0
	move $t1 $s7
	li $t2 4
	mul $v0, $t2, $s3
	move $t3 $v0
	move $t5 $t3
	move $t6 $s4
	lw $t8 12($t6)
	move $t9 $t8
	add $v0, $t9, $t5
	move $s0 $v0
	move $s1 $s0
	move $t0 $s1
	move $t4 $t1
	sw $t4, 0($t0)
	move $t7 $s4
	move $s6 $t8
	sw $s6, 12($t7)
	move $s7 $s5
	add $v0, $s7, 1
	move $s3 $v0
	move $t2 $s3
	move $s5 $t2
	b L7
L8:
	nop
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
	jalr Create_B24
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
	move $t3 $v0
	move $t6 $t3
	move $t5 $s4
	move $t9 $t6
	sw $t9, 4($t5)
	move $s0 $s4
	lw $s1 4($s0)
	move $t1 $s1
	move $t0 $s4
	move $t4 $t1
	sw $t4, 8($t0)
	move $t8 $s4
	lw $t7 8($t8)
	move $s6 $t7
	move $s7 $s6
	lw $s3 0($s7)
	move $t2 $s3
	lw $s5 4($t2)
	move $s2 $s4
	lw $t3 12($s2)
	move $t6 $t3
	move $t5 $s6
	move $t9 $t6
	move $a0 $t5
	move $a1 $t9
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
	jalr $s5
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
	move $s0 $v0
	move $s1 $s0
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
	lw $fp, 500($sp)
	addu $sp, $sp, 508
	j $ra

	.text
	.globl A24_m2
A24_m2:
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
	li $t1 1
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
	.globl Create_B24
Create_B24:
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
	move $t0 $v0
	move $t4 $t0
	move $t8 $t4
	la $t7 B24_m1
	sw $t7, 0($t8)
	move $s7 $t4
	la $s3 B24_m2
	sw $s3, 4($s7)
	li $a0 20
	jal _halloc
	move $v0 $v0
	move $t2 $v0
	move $s4 $t2
	move $s2 $s4
	move $t3 $t4
	sw $t3, 0($s2)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s6 $v0
	move $t6 $s6
	li $t6 0
	move $s5 $s4
	move $t5 $t6
	sw $t5, 4($s5)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t9 $v0
	move $s0 $t9
	li $s0 0
	move $s1 $s4
	move $t1 $s0
	sw $t1, 8($s1)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t0 $v0
	move $t8 $t0
	li $t8 0
	move $t7 $s4
	move $s7 $t8
	sw $s7, 12($t7)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s3 $v0
	move $t2 $s3
	li $t2 0
	move $t4 $s4
	move $s2 $t2
	sw $s2, 16($t4)
	move $v0 $s4
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
	.globl B24_m2
B24_m2:
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
	move $t3 $a1
	li $s6 0
	move $t6 $s6
	li $s5 0
	move $t5 $s5
	move $t9 $t3
	move $s0 $t9
	lw $s1 0($s0)
	move $t1 $s1
	move $t0 $t1
L12:
	move $t8 $t6
	slt $v0, $t8, $t0
	move $t7 $v0
	move $s7 $t7
	beqz $s7 L13
	move $s3 $t3
	li $t2 1
	add $v0, $t2, $t6
	move $t4 $v0
	move $s2 $t4
	li $s4 4
	mul $v0, $s4, $s2
	move $s6 $v0
	move $s5 $s6
	move $t9 $s3
	add $v0, $t9, $s5
	move $s0 $v0
	move $s1 $s0
	move $t1 $s1
	lw $t8 0($t1)
	move $t7 $t8
	move $s7 $t7
	move $t2 $t5
	add $v0, $t2, $s7
	move $t4 $v0
	move $s2 $t4
	move $t5 $s2
	move $s4 $t6
	add $v0, $s4, 1
	move $s6 $v0
	move $s3 $s6
	move $t6 $s3
	b L12
L13:
	nop
	move $s5 $t5
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
	.globl B24_m1
B24_m1:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 508
	sw $ra, -4($fp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	move $t9 $a0
	move $s0 $a1
	move $s1 $s0
	beqz $s1 L14
	li $t1 5
	move $t8 $t1
	b L15
L14:
	nop
	li $t7 10
	move $t8 $t7
L15:
	nop
	move $s7 $t8
	li $t2 1
	add $v0, $t2, $s7
	move $t4 $v0
	li $s2 4
	mul $v0, $s2, $t4
	move $s4 $v0
	move $a0 $s4
	jal _halloc
	move $v0 $v0
	move $s6 $v0
	move $s3 $s6
	move $t3 $s3
	move $t6 $s7
	sw $t6, 0($t3)
	li $t0 0
L16:
	move $t5 $t0
	slt $v0, $t5, $s7
	move $s5 $v0
	move $s0 $s5
	beqz $s0 L17
	li $s1 1
	add $v0, $s1, $t0
	move $t1 $v0
	move $t7 $t1
	li $t2 4
	mul $v0, $t2, $t7
	move $t4 $v0
	move $s2 $t4
	move $s4 $s3
	add $v0, $s4, $s2
	move $s6 $v0
	move $t3 $s6
	move $t6 $t3
	li $t5 0
	sw $t5, 0($t6)
	move $s5 $t0
	add $v0, $s5, 1
	move $s0 $v0
	move $t0 $s0
	b L16
L17:
	nop
	move $s1 $s3
	move $t1 $t9
	move $t7 $s1
	sw $t7, 12($t1)
	li $t2 0
	move $t8 $t2
	move $t4 $t9
	lw $s2 12($t4)
	move $s4 $s2
	move $s6 $s4
	lw $t3 0($s6)
	move $t6 $t3
	move $t5 $t6
L18:
	move $s5 $t8
	slt $v0, $s5, $t5
	move $s0 $v0
	move $s7 $s0
	beqz $s7 L19
	li $t0 1
	add $v0, $t0, $t8
	move $s3 $v0
	move $s1 $s3
	move $t1 $t8
	add $v0, $t1, 1
	move $t7 $v0
	move $t2 $t7
	li $t4 4
	mul $v0, $t4, $s1
	move $s2 $v0
	move $s4 $s2
	move $s6 $t9
	lw $t3 12($s6)
	move $t6 $t3
	add $v0, $t6, $s4
	move $s5 $v0
	move $s0 $s5
	move $s7 $s0
	move $t0 $t2
	sw $t0, 0($s7)
	move $s3 $t9
	move $t1 $t3
	sw $t1, 12($s3)
	move $t7 $t8
	add $v0, $t7, 1
	move $s1 $v0
	move $t4 $s1
	move $t8 $t4
	b L18
L19:
	nop
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
	jalr Create_B24
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
	move $s2 $v0
	move $s6 $s2
	move $s4 $t9
	move $t6 $s6
	sw $t6, 4($s4)
	move $s5 $t9
	lw $s0 4($s5)
	move $t2 $s0
	move $s7 $t9
	move $t0 $t2
	sw $t0, 8($s7)
	move $t3 $t9
	lw $s3 8($t3)
	move $t1 $s3
	move $t7 $t1
	lw $s1 0($t7)
	move $t4 $s1
	lw $t8 4($t4)
	move $t5 $t9
	lw $s2 12($t5)
	move $s6 $s2
	move $s4 $t1
	move $t6 $s6
	move $a0 $s4
	move $a1 $t6
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
	move $s5 $v0
	move $s0 $s5
	move $v0 $s0
	lw $s7, 28($sp)
	lw $s6, 24($sp)
	lw $s5, 20($sp)
	lw $s4, 16($sp)
	lw $s3, 12($sp)
	lw $s2, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 500($sp)
	addu $sp, $sp, 508
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
