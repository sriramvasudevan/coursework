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
	jalr Create_TV
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
	.globl Create_TV
Create_TV:
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
	la $t4 TV_Start
	sw $t4, 0($t3)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t5 $v0
	move $t6 $t5
	move $t7 $t6
	move $t8 $t2
	sw $t8, 0($t7)
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
	.globl TV_Start
TV_Start:
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
	jalr Create_Tree
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
	move $s0 $t9
	move $s2 $s0
	move $s3 $s2
	move $s4 $s3
	lw $s1 0($s4)
	move $s5 $s1
	lw $s6 56($s5)
	li $s7 16
	move $t0 $s3
	move $t1 $s7
	move $a0 $t0
	move $a1 $t1
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
	jalr $s6
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
	move $t4 $t3
	move $t5 $t4
	move $t2 $s2
	move $t7 $t2
	lw $t8 0($t7)
	move $t6 $t8
	lw $t9 32($t6)
	move $s0 $t2
	move $a0 $s0
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
	jalr $t9
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
	move $s4 $v0
	move $s1 $s4
	move $t5 $s1
	li $s5 100000000
	move $a0 $s5
	jal _print
	move $s3 $s2
	move $s7 $s3
	lw $s6 0($s7)
	move $t0 $s6
	lw $t1 16($t0)
	li $t3 8
	move $t4 $s3
	move $t5 $t3
	move $a0 $t4
	move $a1 $t5
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
	jalr $t1
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
	move $t7 $v0
	move $t8 $t7
	move $t5 $t8
	move $t6 $s2
	move $t2 $t6
	lw $t9 0($t2)
	move $s0 $t9
	lw $s4 16($s0)
	li $s1 24
	move $s5 $t6
	move $s7 $s1
	move $a0 $s5
	move $a1 $s7
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
	jalr $s4
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
	move $s6 $v0
	move $t0 $s6
	move $t5 $t0
	move $s3 $s2
	move $t3 $s3
	lw $t1 0($t3)
	move $t4 $t1
	lw $t5 16($t4)
	li $t7 4
	move $t8 $s3
	move $t2 $t7
	move $a0 $t8
	move $a1 $t2
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
	jalr $t5
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
	move $s0 $t9
	move $t5 $s0
	move $t6 $s2
	move $s1 $t6
	lw $s4 0($s1)
	move $s5 $s4
	lw $s7 16($s5)
	li $s6 12
	move $t0 $t6
	move $t3 $s6
	move $a0 $t0
	move $a1 $t3
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
	jalr $s7
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
	move $t1 $v0
	move $t4 $t1
	move $t5 $t4
	move $s3 $s2
	move $t7 $s3
	lw $t5 0($t7)
	move $t8 $t5
	lw $t2 16($t8)
	li $t9 20
	move $s0 $s3
	move $s1 $t9
	move $a0 $s0
	move $a1 $s1
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
	jalr $t2
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
	move $s4 $v0
	move $s5 $s4
	move $t5 $s5
	move $t6 $s2
	move $s6 $t6
	lw $s7 0($s6)
	move $t0 $s7
	lw $t3 16($t0)
	li $t1 28
	move $t4 $t6
	move $t7 $t1
	move $a0 $t4
	move $a1 $t7
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
	jalr $t3
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
	move $t5 $v0
	move $t8 $t5
	move $t5 $t8
	move $s3 $s2
	move $t9 $s3
	lw $t2 0($t9)
	move $s0 $t2
	lw $s1 16($s0)
	li $s4 14
	move $s5 $s3
	move $s6 $s4
	move $a0 $s5
	move $a1 $s6
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
	jalr $s1
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
	move $s7 $v0
	move $t0 $s7
	move $t5 $t0
	move $t6 $s2
	move $t1 $t6
	lw $t3 0($t1)
	move $t4 $t3
	lw $t7 32($t4)
	move $t5 $t6
	move $a0 $t5
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
	jalr $t7
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
	move $t8 $v0
	move $t9 $t8
	move $t5 $t9
	li $t2 100000000
	move $a0 $t2
	jal _print
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
	jalr Create_MyVisitor
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
	move $s3 $s0
	move $s4 $s3
	li $s1 50000000
	move $a0 $s1
	jal _print
	move $s5 $s2
	move $s6 $s5
	lw $s7 0($s6)
	move $t0 $s7
	lw $t1 20($t0)
	move $t3 $s4
	move $t4 $s5
	move $t6 $t3
	move $a0 $t4
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
	jalr $t1
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
	move $t7 $v0
	move $t5 $t7
	move $t8 $t5
	li $t9 100000000
	move $a0 $t9
	jal _print
	move $t2 $s2
	move $s0 $t2
	lw $s3 0($s0)
	move $s1 $s3
	lw $s6 8($s1)
	li $s7 24
	move $t0 $t2
	move $s4 $s7
	move $a0 $t0
	move $a1 $s4
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
	jalr $s6
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
	move $t3 $s5
	move $a0 $t3
	jal _print
	move $t1 $s2
	move $t4 $t1
	lw $t6 0($t4)
	move $t7 $t6
	lw $t5 8($t7)
	li $t8 12
	move $t9 $t1
	move $s0 $t8
	move $a0 $t9
	move $a1 $s0
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
	jalr $t5
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
	move $s3 $v0
	move $s1 $s3
	move $a0 $s1
	jal _print
	move $t2 $s2
	move $s7 $t2
	lw $s6 0($s7)
	move $t0 $s6
	lw $s4 8($t0)
	li $s5 16
	move $t3 $t2
	move $t4 $s5
	move $a0 $t3
	move $a1 $t4
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
	jalr $s4
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
	move $t6 $v0
	move $t7 $t6
	move $a0 $t7
	jal _print
	move $t1 $s2
	move $t8 $t1
	lw $t5 0($t8)
	move $t9 $t5
	lw $s0 8($t9)
	li $s3 50
	move $s1 $t1
	move $s7 $s3
	move $a0 $s1
	move $a1 $s7
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
	jalr $s0
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
	move $s6 $v0
	move $t0 $s6
	move $a0 $t0
	jal _print
	move $t2 $s2
	move $s5 $t2
	lw $s4 0($s5)
	move $t3 $s4
	lw $t4 8($t3)
	li $t6 12
	move $t7 $t2
	move $t8 $t6
	move $a0 $t7
	move $a1 $t8
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
	jalr $t4
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
	move $t5 $v0
	move $t9 $t5
	move $a0 $t9
	jal _print
	move $t1 $s2
	move $s3 $t1
	lw $s0 0($s3)
	move $s1 $s0
	lw $s7 72($s1)
	li $s6 12
	move $t0 $t1
	move $s5 $s6
	move $a0 $t0
	move $a1 $s5
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
	jalr $s7
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
	move $s4 $v0
	move $t3 $s4
	move $t5 $t3
	move $t2 $s2
	move $t6 $t2
	lw $t4 0($t6)
	move $t7 $t4
	lw $t8 32($t7)
	move $t5 $t2
	move $a0 $t5
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
	move $s3 $t9
	move $t5 $s3
	move $s0 $s2
	move $s1 $s0
	lw $t1 0($s1)
	move $s6 $t1
	lw $s7 8($s6)
	li $t0 12
	move $s5 $s0
	move $s4 $t0
	move $a0 $s5
	move $a1 $s4
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
	jalr $s7
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
	move $a0 $t6
	jal _print
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
	lw $fp, 500($sp)
	addu $sp, $sp, 508
	j $ra

	.text
	.globl Create_Tree
Create_Tree:
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
	li $a0 84
	jal _halloc
	move $v0 $v0
	move $t7 $v0
	move $t2 $t7
	move $t8 $t2
	la $t5 Tree_GetRight
	sw $t5, 0($t8)
	move $t9 $t2
	la $s3 Tree_GetLeft
	sw $s3, 4($t9)
	move $s2 $t2
	la $s1 Tree_Search
	sw $s1, 8($s2)
	move $t1 $t2
	la $s6 Tree_RemoveRight
	sw $s6, 12($t1)
	move $s0 $t2
	la $t0 Tree_Insert
	sw $t0, 16($s0)
	move $s7 $t2
	la $s5 Tree_accept
	sw $s5, 20($s7)
	move $s4 $t2
	la $t3 Tree_SetLeft
	sw $t3, 24($s4)
	move $t6 $t2
	la $t4 Tree_Compare
	sw $t4, 28($t6)
	move $t7 $t2
	la $t8 Tree_Print
	sw $t8, 32($t7)
	move $t5 $t2
	la $t9 Tree_GetHas_Left
	sw $t9, 36($t5)
	move $s3 $t2
	la $s2 Tree_RemoveLeft
	sw $s2, 40($s3)
	move $s1 $t2
	la $t1 Tree_SetHas_Left
	sw $t1, 44($s1)
	move $s6 $t2
	la $s0 Tree_GetHas_Right
	sw $s0, 48($s6)
	move $t0 $t2
	la $s7 Tree_GetKey
	sw $s7, 52($t0)
	move $s5 $t2
	la $s4 Tree_Init
	sw $s4, 56($s5)
	move $t3 $t2
	la $t6 Tree_SetKey
	sw $t6, 60($t3)
	move $t4 $t2
	la $t7 Tree_RecPrint
	sw $t7, 64($t4)
	move $t8 $t2
	la $t5 Tree_Remove
	sw $t5, 68($t8)
	move $t9 $t2
	la $s3 Tree_Delete
	sw $s3, 72($t9)
	move $s2 $t2
	la $s1 Tree_SetRight
	sw $s1, 76($s2)
	move $t1 $t2
	la $s6 Tree_SetHas_Right
	sw $s6, 80($t1)
	li $a0 28
	jal _halloc
	move $v0 $v0
	move $s0 $v0
	move $t0 $s0
	move $s7 $t0
	move $s5 $t2
	sw $s5, 0($s7)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s4 $v0
	move $t3 $s4
	li $t3 0
	move $t6 $t0
	move $t4 $t3
	sw $t4, 4($t6)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t7 $v0
	move $t8 $t7
	li $t8 0
	move $t5 $t0
	move $t9 $t8
	sw $t9, 8($t5)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s3 $v0
	move $s2 $s3
	li $s2 0
	move $s1 $t0
	move $t1 $s2
	sw $t1, 12($s1)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s6 $v0
	move $s0 $s6
	li $s0 0
	move $t2 $t0
	move $s7 $s0
	sw $s7, 16($t2)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s5 $v0
	move $s4 $s5
	li $s4 0
	move $t3 $t0
	move $t6 $s4
	sw $t6, 20($t3)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t4 $v0
	move $t7 $t4
	li $t7 0
	move $t8 $t0
	move $t5 $t7
	sw $t5, 24($t8)
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
	.globl Tree_Init
Tree_Init:
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
	move $t9 $a0
	move $s2 $a1
	move $s3 $s2
	move $s1 $t9
	move $t1 $s3
	sw $t1, 24($s1)
	li $s6 0
	move $s0 $t9
	move $t2 $s6
	sw $t2, 20($s0)
	li $s7 0
	move $s5 $t9
	move $s4 $s7
	sw $s4, 8($s5)
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
	lw $fp, 496($sp)
	addu $sp, $sp, 504
	j $ra

	.text
	.globl Tree_SetRight
Tree_SetRight:
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
	move $t7 $a0
	move $t4 $a1
	move $t6 $t4
	move $t8 $t7
	move $t5 $t6
	sw $t5, 16($t8)
	li $t0 1
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
	.globl Tree_SetLeft
Tree_SetLeft:
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
	move $s3 $a0
	move $s1 $a1
	move $s2 $s1
	move $t1 $s3
	move $s6 $s2
	sw $s6, 12($t1)
	li $s0 1
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
	.globl Tree_GetRight
Tree_GetRight:
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
	move $t9 $t2
	lw $s7 16($t9)
	move $s5 $s7
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
	.globl Tree_GetLeft
Tree_GetLeft:
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
	move $s4 $t3
	lw $t4 12($s4)
	move $t7 $t4
	move $v0 $t7
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
	.globl Tree_GetKey
Tree_GetKey:
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
	move $t8 $a0
	move $t6 $t8
	lw $t5 24($t6)
	move $t0 $t5
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
	.globl Tree_SetKey
Tree_SetKey:
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
	move $s2 $a0
	move $s3 $a1
	move $s1 $s3
	move $t1 $s2
	move $s6 $s1
	sw $s6, 24($t1)
	li $s0 1
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
	.globl Tree_GetHas_Right
Tree_GetHas_Right:
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
	move $t9 $t2
	lw $s7 8($t9)
	move $s5 $s7
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
	.globl Tree_GetHas_Left
Tree_GetHas_Left:
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
	move $s4 $t3
	lw $t4 20($s4)
	move $t7 $t4
	move $v0 $t7
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
	.globl Tree_SetHas_Left
Tree_SetHas_Left:
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
	move $t5 $a0
	move $t8 $a1
	move $t6 $t8
	move $t0 $t5
	move $s3 $t6
	sw $s3, 20($t0)
	li $s2 1
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
	.globl Tree_SetHas_Right
Tree_SetHas_Right:
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
	move $s6 $a0
	move $t1 $a1
	move $s1 $t1
	move $s0 $s6
	move $t2 $s1
	sw $t2, 8($s0)
	li $t9 1
	move $v0 $t9
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
	.globl Tree_Compare
Tree_Compare:
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
	move $s5 $a1
	move $t3 $a2
	li $s7 0
	move $s4 $s7
	move $t4 $t3
	add $v0, $t4, 1
	move $t7 $v0
	move $t8 $t7
	move $t5 $t8
	move $t6 $s5
	slt $v0, $t6, $t3
	move $t0 $v0
	move $s3 $t0
	beqz $s3 L25
	li $s2 0
	move $s4 $s2
	b L28
L25:
	nop
	move $t1 $s5
	slt $v0, $t1, $t5
	move $s6 $v0
	move $s1 $s6
	li $s0 1
	sub $v0, $s0, $s1
	move $t2 $v0
	move $t9 $t2
	beqz $t9 L26
	li $s7 0
	move $s4 $s7
	b L27
L26:
	nop
	li $t4 1
	move $s4 $t4
L27:
	nop
L28:
	nop
	move $t7 $s4
	move $v0 $t7
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
	.globl Tree_Insert
Tree_Insert:
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
	move $t8 $a0
	move $t3 $a1
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
	jalr Create_Tree
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
	move $t6 $v0
	move $t0 $t6
	move $s3 $t0
	move $s2 $s3
	move $s5 $s2
	lw $t5 0($s5)
	move $t1 $t5
	lw $s6 56($t1)
	move $s1 $t3
	move $s0 $s2
	move $t2 $s1
	move $a0 $s0
	move $a1 $t2
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
	jalr $s6
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
	move $s7 $t9
	move $t4 $s7
	move $s4 $t8
	move $t7 $s4
	li $t6 1
	move $t0 $t6
L30:
	move $s5 $t0
	beqz $s5 L37
	move $t5 $t7
	move $t1 $t5
	lw $s2 0($t1)
	move $s1 $s2
	lw $s6 52($s1)
	move $s0 $t5
	move $a0 $s0
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
	jalr $s6
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
	move $t2 $v0
	move $t9 $t2
	move $s7 $t9
	move $t4 $t3
	slt $v0, $t4, $s7
	move $t8 $v0
	move $s4 $t8
	beqz $s4 L33
	move $t6 $t7
	move $s5 $t6
	lw $t1 0($s5)
	move $s2 $t1
	lw $s1 36($s2)
	move $t5 $t6
	move $a0 $t5
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
	jalr $s1
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
	move $s6 $v0
	move $s0 $s6
	beqz $s0 L31
	move $t2 $t7
	move $t9 $t2
	lw $s7 0($t9)
	move $t4 $s7
	lw $t8 4($t4)
	move $s4 $t2
	move $a0 $s4
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
	move $t1 $s5
	move $t7 $t1
	b L32
L31:
	nop
	li $s2 0
	move $t0 $s2
	move $t6 $t7
	move $s1 $t6
	lw $t5 0($s1)
	move $s6 $t5
	lw $s0 44($s6)
	li $t9 1
	move $s7 $t6
	move $t4 $t9
	move $a0 $s7
	move $a1 $t4
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
	jalr $s0
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
	move $t2 $v0
	move $t8 $t2
	move $t4 $t8
	move $s4 $t7
	move $s5 $s4
	lw $t1 0($s5)
	move $s2 $t1
	lw $s1 24($s2)
	move $t5 $s3
	move $s6 $s4
	move $t6 $t5
	move $a0 $s6
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
	jalr $s1
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
	move $s0 $t9
	move $t4 $s0
L32:
	nop
	b L36
L33:
	nop
	move $s7 $t7
	move $t4 $s7
	lw $t2 0($t4)
	move $t8 $t2
	lw $s5 48($t8)
	move $t1 $s7
	move $a0 $t1
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
	move $s2 $v0
	move $s4 $s2
	beqz $s4 L34
	move $t5 $t7
	move $s1 $t5
	lw $s6 0($s1)
	move $t6 $s6
	lw $t9 0($t6)
	move $s0 $t5
	move $a0 $s0
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
	jalr $t9
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
	move $t4 $v0
	move $t2 $t4
	move $t7 $t2
	b L35
L34:
	nop
	li $t8 0
	move $t0 $t8
	move $s7 $t7
	move $s5 $s7
	lw $t1 0($s5)
	move $s2 $t1
	lw $s4 80($s2)
	li $s1 1
	move $s6 $s7
	move $t6 $s1
	move $a0 $s6
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
	jalr $s4
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
	move $t5 $v0
	move $t9 $t5
	move $t4 $t9
	move $s0 $t7
	move $t4 $s0
	lw $t2 0($t4)
	move $t8 $t2
	lw $s5 76($t8)
	move $t1 $s3
	move $s2 $s0
	move $s7 $t1
	move $a0 $s2
	move $a1 $s7
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
	move $s1 $v0
	move $s4 $s1
	move $t4 $s4
L35:
	nop
L36:
	nop
	b L30
L37:
	nop
	li $s6 1
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
	lw $fp, 500($sp)
	addu $sp, $sp, 508
	j $ra

	.text
	.globl Tree_Delete
Tree_Delete:
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
	move $t9 $a0
	move $t5 $a1
	move $t6 $t9
	move $t4 $t6
	move $t2 $t9
	move $t8 $t2
	li $s0 1
	move $t1 $s0
	li $s5 0
	move $s2 $s5
	li $s7 1
	move $s1 $s7
L38:
	move $s4 $t1
	beqz $s4 L52
	move $t3 $t4
	move $s3 $t3
	lw $t7 0($s3)
	move $t0 $t7
	lw $s6 52($t0)
	move $t6 $t3
	move $a0 $t6
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
	jalr $s6
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
	move $t2 $v0
	move $s0 $t2
	move $s5 $s0
	move $s7 $t5
	slt $v0, $s7, $s5
	move $s4 $v0
	move $s3 $s4
	beqz $s3 L41
	move $t7 $t4
	move $t0 $t7
	lw $t3 0($t0)
	move $s6 $t3
	lw $t6 36($s6)
	move $t2 $t7
	move $a0 $t2
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
	jalr $t6
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
	move $s7 $s0
	beqz $s7 L39
	move $s4 $t4
	move $t8 $s4
	move $s3 $t4
	move $t0 $s3
	lw $t3 0($t0)
	move $s6 $t3
	lw $t7 4($s6)
	move $t6 $s3
	move $a0 $t6
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
	jalr $t7
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
	move $t2 $v0
	move $s0 $t2
	move $t4 $s0
	b L40
L39:
	nop
	li $s7 0
	move $t1 $s7
L40:
	nop
	b L51
L41:
	nop
	move $s4 $s5
	slt $v0, $s4, $t5
	move $t0 $v0
	move $t3 $t0
	beqz $t3 L44
	move $s6 $t4
	move $t7 $s6
	lw $t6 0($t7)
	move $t2 $t6
	lw $s0 48($t2)
	move $s7 $s6
	move $a0 $s7
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
	jalr $s0
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
	move $s4 $s5
	beqz $s4 L42
	move $t0 $t4
	move $t8 $t0
	move $t3 $t4
	move $t7 $t3
	lw $t6 0($t7)
	move $t2 $t6
	lw $s6 0($t2)
	move $s0 $t3
	move $a0 $s0
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
	jalr $s6
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
	move $s7 $v0
	move $s5 $s7
	move $t4 $s5
	b L43
L42:
	nop
	li $s4 0
	move $t1 $s4
L43:
	nop
	b L50
L44:
	nop
	move $t0 $s1
	beqz $t0 L48
	li $s3 0
	move $t7 $t4
	move $t6 $t7
	lw $t2 0($t6)
	move $t3 $t2
	lw $s6 48($t3)
	move $s0 $t7
	move $a0 $s0
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
	jalr $s6
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
	move $s7 $v0
	li $s5 1
	sub $v0, $s5, $s7
	move $s4 $v0
	move $t0 $s4
	beqz $t0 L45
	move $t6 $t4
	move $t2 $t6
	lw $t3 0($t2)
	move $t7 $t3
	lw $s6 36($t7)
	move $s0 $t6
	move $a0 $s0
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
	jalr $s6
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
	move $s7 $v0
	li $s5 1
	sub $v0, $s5, $s7
	move $s4 $v0
	move $t0 $s4
	beqz $t0 L45
	li $s3 1
L45:
	nop
	move $t2 $s3
	beqz $t2 L46
	li $t3 1
	move $t7 $t3
	b L47
L46:
	nop
	move $t6 $t9
	move $s6 $t6
	lw $s0 0($s6)
	move $s7 $s0
	lw $s5 68($s7)
	move $s4 $t8
	move $t0 $t4
	move $s3 $t6
	move $t2 $s4
	move $t3 $t0
	move $a0 $s3
	move $a1 $t2
	move $a2 $t3
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
	move $s6 $v0
	move $s0 $s6
	move $t7 $s0
L47:
	nop
	b L49
L48:
	nop
	move $s7 $t9
	move $t6 $s7
	lw $s4 0($t6)
	move $t0 $s4
	lw $s5 68($t0)
	move $s3 $t8
	move $t2 $t4
	move $t3 $s7
	move $s6 $s3
	move $s0 $t2
	move $a0 $t3
	move $a1 $s6
	move $a2 $s0
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
	move $t6 $v0
	move $s4 $t6
	move $t7 $s4
L49:
	nop
	li $t0 1
	move $s2 $t0
	li $s7 0
	move $t1 $s7
L50:
	nop
L51:
	nop
	li $s3 0
	move $s1 $s3
	b L38
L52:
	nop
	move $t2 $s2
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
	lw $fp, 504($sp)
	addu $sp, $sp, 512
	j $ra

	.text
	.globl Tree_Remove
Tree_Remove:
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
	move $s6 $a0
	move $t3 $a1
	move $s5 $a2
	move $s0 $s5
	move $t6 $s0
	lw $t7 0($t6)
	move $s4 $t7
	lw $t0 36($s4)
	move $s7 $s0
	move $a0 $s7
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
	jalr $t0
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
	move $s3 $v0
	move $t5 $s3
	beqz $t5 L53
	move $t9 $s6
	move $t4 $t9
	lw $t8 0($t4)
	move $t1 $t8
	lw $s1 40($t1)
	move $s2 $t3
	move $t2 $s5
	move $t6 $t9
	move $t7 $s2
	move $s4 $t2
	move $a0 $t6
	move $a1 $t7
	move $a2 $s4
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
	jalr $s1
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
	move $t0 $s0
	move $s7 $t0
	b L58
L53:
	nop
	move $s3 $s5
	move $t5 $s3
	lw $t4 0($t5)
	move $t8 $t4
	lw $t1 48($t8)
	move $t9 $s3
	move $a0 $t9
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
	jalr $t1
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
	move $t2 $s2
	beqz $t2 L54
	move $s1 $s6
	move $t6 $s1
	lw $t7 0($t6)
	move $s4 $t7
	lw $s0 12($s4)
	move $t0 $t3
	move $s7 $s5
	move $t5 $s1
	move $t4 $t0
	move $t8 $s7
	move $a0 $t5
	move $a1 $t4
	move $a2 $t8
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
	jalr $s0
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
	move $s3 $v0
	move $t1 $s3
	move $s7 $t1
	b L57
L54:
	nop
	move $t9 $s5
	move $s2 $t9
	lw $t2 0($s2)
	move $t6 $t2
	lw $t7 52($t6)
	move $s4 $t9
	move $a0 $s4
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
	jalr $t7
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
	move $s1 $v0
	move $t0 $s1
	move $s7 $t0
	move $s0 $t3
	move $t5 $s0
	lw $t4 0($t5)
	move $t8 $t4
	lw $s3 4($t8)
	move $t1 $s0
	move $a0 $t1
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
	jalr $s3
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
	move $s2 $s5
	move $t2 $s2
	move $t6 $t2
	lw $t9 0($t6)
	move $t7 $t9
	lw $s4 52($t7)
	move $s1 $t2
	move $a0 $s1
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
	jalr $s4
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
	move $t5 $t0
	move $t4 $t5
	move $t8 $s6
	move $s0 $t8
	lw $s3 0($s0)
	move $t1 $s3
	lw $s5 28($t1)
	move $s2 $s7
	move $t6 $t4
	move $t9 $t8
	move $t7 $s2
	move $t2 $t6
	move $a0 $t9
	move $a1 $t7
	move $a2 $t2
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
	move $s4 $v0
	move $s1 $s4
	beqz $s1 L55
	move $t0 $t3
	move $t5 $t0
	lw $s0 0($t5)
	move $s3 $s0
	lw $t1 24($s3)
	move $s7 $s6
	lw $t4 4($s7)
	move $t8 $t4
	move $s2 $t0
	move $t6 $t8
	move $a0 $s2
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
	jalr $t1
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
	move $t9 $s5
	move $s7 $t9
	move $t7 $t3
	move $t2 $t7
	lw $s4 0($t2)
	move $s1 $s4
	lw $t5 44($s1)
	li $s0 0
	move $s3 $t7
	move $s7 $s0
	move $a0 $s3
	move $a1 $s7
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
	jalr $t5
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
	move $t4 $v0
	move $t0 $t4
	move $s7 $t0
	b L56
L55:
	nop
	move $t8 $t3
	move $t1 $t8
	lw $s2 0($t1)
	move $t6 $s2
	lw $s5 76($t6)
	move $t9 $s6
	lw $t2 4($t9)
	move $s4 $t2
	move $s1 $t8
	move $t7 $s4
	move $a0 $s1
	move $a1 $t7
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
	move $t5 $s0
	move $s7 $t5
	move $s3 $t3
	move $s7 $s3
	lw $t4 0($s7)
	move $t0 $t4
	lw $t1 80($t0)
	li $s2 0
	move $t6 $s3
	move $s6 $s2
	move $a0 $t6
	move $a1 $s6
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
	jalr $t1
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
	move $t2 $t9
	move $s7 $t2
L56:
	nop
L57:
	nop
L58:
	nop
	li $t8 1
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
	lw $fp, 504($sp)
	addu $sp, $sp, 512
	j $ra

	.text
	.globl Tree_RemoveRight
Tree_RemoveRight:
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
	move $s1 $a0
	move $s4 $a1
	move $s5 $a2
L59:
	move $t7 $s5
	move $s0 $t7
	lw $t5 0($s0)
	move $t3 $t5
	lw $s7 48($t3)
	move $t4 $t7
	move $a0 $t4
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
	jalr $s7
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
	move $s3 $t0
	beqz $s3 L60
	move $s2 $s5
	move $t1 $s2
	lw $t6 0($t1)
	move $s6 $t6
	lw $t9 60($s6)
	move $t2 $s5
	move $t8 $t2
	lw $s0 0($t8)
	move $t5 $s0
	lw $t3 0($t5)
	move $t7 $t2
	move $a0 $t7
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
	jalr $t3
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
	move $s7 $v0
	move $t4 $s7
	move $t0 $t4
	move $s3 $t0
	lw $t1 0($s3)
	move $t6 $t1
	lw $s6 52($t6)
	move $t8 $t0
	move $a0 $t8
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
	jalr $s6
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
	move $t5 $s0
	move $t2 $s2
	move $t3 $t5
	move $a0 $t2
	move $a1 $t3
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
	jalr $t9
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
	move $t7 $v0
	move $s7 $t7
	move $t4 $s7
	move $s3 $s5
	move $s4 $s3
	move $t1 $s5
	move $t6 $t1
	lw $t0 0($t6)
	move $s6 $t0
	lw $t8 0($s6)
	move $s0 $t1
	move $a0 $s0
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
	move $s2 $v0
	move $t5 $s2
	move $s5 $t5
	b L59
L60:
	nop
	move $t9 $s4
	move $t2 $t9
	lw $t3 0($t2)
	move $t7 $t3
	lw $s7 76($t7)
	move $s3 $s1
	lw $t6 4($s3)
	move $t0 $t6
	move $s6 $t9
	move $t1 $t0
	move $a0 $s6
	move $a1 $t1
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
	jalr $s7
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
	move $t8 $v0
	move $s0 $t8
	move $t4 $s0
	move $s2 $s4
	move $t5 $s2
	lw $s5 0($t5)
	move $t2 $s5
	lw $t3 80($t2)
	li $t7 0
	move $s1 $s2
	move $s3 $t7
	move $a0 $s1
	move $a1 $s3
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
	jalr $t3
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
	move $t6 $v0
	move $t9 $t6
	move $t4 $t9
	li $t0 1
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
	lw $fp, 500($sp)
	addu $sp, $sp, 508
	j $ra

	.text
	.globl Tree_RemoveLeft
Tree_RemoveLeft:
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
	move $s6 $a0
	move $t1 $a1
	move $t8 $a2
L61:
	move $s7 $t8
	move $t4 $s7
	lw $s0 0($t4)
	move $s4 $s0
	lw $t5 36($s4)
	move $s5 $s7
	move $a0 $s5
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
	jalr $t5
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
	move $t2 $v0
	move $s2 $t2
	beqz $s2 L62
	move $t7 $t8
	move $t3 $t7
	lw $s1 0($t3)
	move $s3 $s1
	lw $t6 60($s3)
	move $t9 $t8
	move $t0 $t9
	lw $t4 0($t0)
	move $s0 $t4
	lw $s4 4($s0)
	move $s7 $t9
	move $a0 $s7
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
	jalr $s4
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
	move $t5 $v0
	move $s5 $t5
	move $t2 $s5
	move $s2 $t2
	lw $t3 0($s2)
	move $s1 $t3
	lw $s3 52($s1)
	move $t0 $t2
	move $a0 $t0
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
	jalr $s3
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
	move $t4 $v0
	move $s0 $t4
	move $t9 $t7
	move $s4 $s0
	move $a0 $t9
	move $a1 $s4
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
	jalr $t6
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
	move $s7 $v0
	move $t5 $s7
	move $s5 $t5
	move $s2 $t8
	move $t1 $s2
	move $t3 $t8
	move $s1 $t3
	lw $t2 0($s1)
	move $s3 $t2
	lw $t0 4($s3)
	move $t4 $t3
	move $a0 $t4
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
	jalr $t0
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
	move $t7 $v0
	move $s0 $t7
	move $t8 $s0
	b L61
L62:
	nop
	move $t6 $t1
	move $t9 $t6
	lw $s4 0($t9)
	move $s7 $s4
	lw $t5 24($s7)
	move $s2 $s6
	lw $s1 4($s2)
	move $t2 $s1
	move $s3 $t6
	move $t3 $t2
	move $a0 $s3
	move $a1 $t3
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
	jalr $t5
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
	move $t4 $t0
	move $s5 $t4
	move $t7 $t1
	move $s0 $t7
	lw $t8 0($s0)
	move $t9 $t8
	lw $s4 44($t9)
	li $s7 0
	move $s6 $t7
	move $s2 $s7
	move $a0 $s6
	move $a1 $s2
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
	jalr $s4
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
	move $s1 $v0
	move $t6 $s1
	move $s5 $t6
	li $t2 1
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
	lw $fp, 500($sp)
	addu $sp, $sp, 508
	j $ra

	.text
	.globl Tree_Search
Tree_Search:
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
	move $t5 $a0
	move $t3 $a1
	move $s3 $t5
	move $t0 $s3
	li $s5 1
	move $t4 $s5
	li $t1 0
	move $s0 $t1
L63:
	move $t8 $t4
	beqz $t8 L72
	move $t9 $t0
	move $t7 $t9
	lw $s7 0($t7)
	move $s4 $s7
	lw $s6 52($s4)
	move $s2 $t9
	move $a0 $s2
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
	jalr $s6
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
	move $s1 $v0
	move $t6 $s1
	move $t2 $t6
	move $t5 $t3
	slt $v0, $t5, $t2
	move $s3 $v0
	move $s5 $s3
	beqz $s5 L66
	move $t1 $t0
	move $t8 $t1
	lw $t7 0($t8)
	move $s7 $t7
	lw $s4 36($s7)
	move $t9 $t1
	move $a0 $t9
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
	jalr $s4
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
	move $s6 $v0
	move $s2 $s6
	beqz $s2 L64
	move $s1 $t0
	move $t6 $s1
	lw $t5 0($t6)
	move $s3 $t5
	lw $s5 4($s3)
	move $t8 $s1
	move $a0 $t8
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
	move $t7 $v0
	move $s7 $t7
	move $t0 $s7
	b L65
L64:
	nop
	li $t1 0
	move $t4 $t1
L65:
	nop
	b L71
L66:
	nop
	move $s4 $t2
	slt $v0, $s4, $t3
	move $t9 $v0
	move $s6 $t9
	beqz $s6 L69
	move $s2 $t0
	move $t6 $s2
	lw $t5 0($t6)
	move $s3 $t5
	lw $s1 48($s3)
	move $s5 $s2
	move $a0 $s5
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
	jalr $s1
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
	move $t8 $v0
	move $t7 $t8
	beqz $t7 L67
	move $s7 $t0
	move $t1 $s7
	lw $t2 0($t1)
	move $s4 $t2
	lw $t9 0($s4)
	move $s6 $s7
	move $a0 $s6
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
	jalr $t9
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
	move $t6 $v0
	move $t5 $t6
	move $t0 $t5
	b L68
L67:
	nop
	li $s3 0
	move $t4 $s3
L68:
	nop
	b L70
L69:
	nop
	li $s2 1
	move $s0 $s2
	li $s1 0
	move $t4 $s1
L70:
	nop
L71:
	nop
	b L63
L72:
	nop
	move $s5 $s0
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
	.globl Tree_Print
Tree_Print:
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
	move $t8 $a0
	move $t7 $t8
	move $t1 $t7
	move $t2 $t8
	move $s4 $t2
	lw $s7 0($s4)
	move $t9 $s7
	lw $s6 64($t9)
	move $t6 $t1
	move $t5 $t2
	move $s3 $t6
	move $a0 $t5
	move $a1 $s3
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
	jalr $s6
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
	move $s1 $s2
	move $t3 $s1
	li $t0 1
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
	lw $fp, 500($sp)
	addu $sp, $sp, 508
	j $ra

	.text
	.globl Tree_RecPrint
Tree_RecPrint:
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
	move $s0 $a0
	move $t4 $a1
	move $s5 $t4
	move $t7 $s5
	lw $t8 0($t7)
	move $s4 $t8
	lw $s7 36($s4)
	move $t9 $s5
	move $a0 $t9
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
	jalr $s7
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
	move $t1 $v0
	move $t2 $t1
	beqz $t2 L73
	move $t6 $s0
	move $s6 $t6
	lw $t5 0($s6)
	move $s3 $t5
	lw $s2 64($s3)
	move $s1 $t4
	move $t3 $s1
	lw $t0 0($t3)
	move $t7 $t0
	lw $t8 4($t7)
	move $s4 $s1
	move $a0 $s4
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
	move $s7 $s5
	move $t9 $t6
	move $t1 $s7
	move $a0 $t9
	move $a1 $t1
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
	move $t2 $v0
	move $s6 $t2
	move $t5 $s6
	b L74
L73:
	nop
	li $s3 1
	move $t5 $s3
L74:
	nop
	move $t3 $t4
	move $t0 $t3
	lw $t7 0($t0)
	move $s1 $t7
	lw $t8 52($s1)
	move $s4 $t3
	move $a0 $s4
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
	move $t6 $s5
	move $a0 $t6
	jal _print
	move $s7 $t4
	move $s2 $s7
	lw $t9 0($s2)
	move $t1 $t9
	lw $t2 48($t1)
	move $s6 $s7
	move $a0 $s6
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
	jalr $t2
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
	move $t5 $v0
	move $s3 $t5
	beqz $s3 L75
	move $t0 $s0
	move $t7 $t0
	lw $s1 0($t7)
	move $t3 $s1
	lw $t8 64($t3)
	move $s4 $t4
	move $s5 $s4
	lw $t6 0($s5)
	move $s2 $t6
	lw $t9 0($s2)
	move $t1 $s4
	move $a0 $t1
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
	jalr $t9
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
	move $s7 $v0
	move $t2 $s7
	move $s6 $t0
	move $t5 $t2
	move $a0 $s6
	move $a1 $t5
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
	move $s3 $v0
	move $s0 $s3
	move $t5 $s0
	b L76
L75:
	nop
	li $t7 1
	move $t5 $t7
L76:
	nop
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
	lw $fp, 500($sp)
	addu $sp, $sp, 508
	j $ra

	.text
	.globl Tree_accept
Tree_accept:
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
	move $s5 $a0
	move $t4 $a1
	li $t3 333
	move $a0 $t3
	jal _print
	move $t6 $t4
	move $s2 $t6
	lw $s4 0($s2)
	move $t9 $s4
	lw $t1 0($t9)
	move $s7 $s5
	move $t0 $t6
	move $t2 $s7
	move $a0 $t0
	move $a1 $t2
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
	jalr $t1
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
	move $t8 $v0
	move $s6 $t8
	move $t5 $s6
	li $s3 0
	move $v0 $s3
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
	.globl Create_Visitor
Create_Visitor:
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
	move $s0 $v0
	move $t7 $s0
	move $s1 $t7
	la $t3 Visitor_visit
	sw $t3, 0($s1)
	li $a0 12
	jal _halloc
	move $v0 $v0
	move $t4 $v0
	move $s2 $t4
	move $s4 $s2
	move $t9 $t7
	sw $t9, 0($s4)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s5 $v0
	move $t6 $s5
	li $t6 0
	move $s7 $s2
	move $t1 $t6
	sw $t1, 4($s7)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t0 $v0
	move $t2 $t0
	li $t2 0
	move $t8 $s2
	move $s6 $t2
	sw $s6, 8($t8)
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
	.globl Visitor_visit
Visitor_visit:
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
	move $s3 $a0
	move $t5 $a1
	move $s0 $t5
	move $s1 $s0
	lw $t3 0($s1)
	move $t4 $t3
	lw $t7 48($t4)
	move $s4 $s0
	move $a0 $s4
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
	jalr $t7
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
	move $s5 $t9
	beqz $s5 L78
	move $t6 $s3
	lw $s7 4($t6)
	move $t1 $s7
	move $t0 $t1
	lw $t2 0($t0)
	move $t8 $t2
	lw $s6 20($t8)
	move $s2 $s3
	move $s1 $t1
	move $t3 $s2
	move $a0 $s1
	move $a1 $t3
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
	jalr $s6
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
	move $t4 $v0
	move $s0 $t4
	move $t7 $s0
	b L79
L78:
	nop
	li $s4 0
	move $t7 $s4
L79:
	nop
	move $t9 $t5
	move $s5 $t9
	lw $t6 0($s5)
	move $s7 $t6
	lw $t0 36($s7)
	move $t2 $t9
	move $a0 $t2
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
	jalr $t0
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
	move $t8 $v0
	move $t1 $t8
	beqz $t1 L80
	move $s2 $t5
	move $s6 $s2
	lw $s1 0($s6)
	move $t3 $s1
	lw $t4 4($t3)
	move $s0 $s2
	move $a0 $s0
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
	jalr $t4
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
	move $t7 $v0
	move $s4 $t7
	move $s5 $s3
	move $t6 $s4
	sw $t6, 8($s5)
	b L81
L80:
	nop
	li $s7 0
	move $t7 $s7
L81:
	nop
	li $t9 0
	move $v0 $t9
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
	.globl Create_MyVisitor
Create_MyVisitor:
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
	move $t0 $v0
	move $t2 $t0
	move $t8 $t2
	la $t1 MyVisitor_visit
	sw $t1, 0($t8)
	li $a0 12
	jal _halloc
	move $v0 $v0
	move $t5 $v0
	move $s6 $t5
	move $s1 $s6
	move $t3 $t2
	sw $t3, 0($s1)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s2 $v0
	move $t4 $s2
	li $t4 0
	move $s0 $s6
	move $t7 $t4
	sw $t7, 4($s0)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s3 $v0
	move $s4 $s3
	li $s4 0
	move $s5 $s6
	move $t6 $s4
	sw $t6, 8($s5)
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
	.globl MyVisitor_visit
MyVisitor_visit:
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
	move $s7 $a1
	move $t0 $s7
	move $t8 $t0
	lw $t1 0($t8)
	move $t5 $t1
	lw $t2 48($t5)
	move $s1 $t0
	move $a0 $s1
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
	jalr $t2
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
	move $s2 $t3
	beqz $s2 L83
	move $t4 $s7
	move $s0 $t4
	lw $t7 0($s0)
	move $s3 $t7
	lw $s4 0($s3)
	move $s5 $t4
	move $a0 $s5
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
	jalr $s4
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
	move $t6 $v0
	move $s6 $t6
	move $t8 $t9
	move $t1 $s6
	sw $t1, 4($t8)
	move $t5 $t9
	lw $t0 4($t5)
	move $t2 $t0
	move $s1 $t2
	lw $t3 0($s1)
	move $s2 $t3
	lw $s0 20($s2)
	move $t7 $t9
	move $s3 $t2
	move $t4 $t7
	move $a0 $s3
	move $a1 $t4
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
	jalr $s0
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
	move $s4 $v0
	move $s5 $s4
	move $t6 $s5
	b L84
L83:
	nop
	li $s6 0
	move $t6 $s6
L84:
	nop
	move $t8 $s7
	move $t1 $t8
	lw $t5 0($t1)
	move $t0 $t5
	lw $s1 52($t0)
	move $t3 $t8
	move $a0 $t3
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
	jalr $s1
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
	move $t2 $s2
	move $a0 $t2
	jal _print
	move $t7 $s7
	move $s0 $t7
	lw $s3 0($s0)
	move $t4 $s3
	lw $s4 36($t4)
	move $s5 $t7
	move $a0 $s5
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
	jalr $s4
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
	move $t6 $v0
	move $s6 $t6
	beqz $s6 L85
	move $t1 $s7
	move $t5 $t1
	lw $t0 0($t5)
	move $t8 $t0
	lw $s1 4($t8)
	move $t3 $t1
	move $a0 $t3
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
	jalr $s1
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
	move $t2 $s2
	move $s0 $t9
	move $s3 $t2
	sw $s3, 8($s0)
	b L86
L85:
	nop
	li $t4 0
	move $t6 $t4
L86:
	nop
	li $t7 0
	move $v0 $t7
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
