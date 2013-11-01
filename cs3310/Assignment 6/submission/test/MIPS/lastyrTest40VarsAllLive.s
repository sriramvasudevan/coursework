	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 196
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
	addu $sp, $sp, 196
	j $ra

	.text
	.globl Finder_Find
Finder_Find:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 196
	sw $ra, -4($fp)
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	move $t0 $a1
	move $v1 $t0
	sw $v1, 84($sp)
	li $t2 1
	lw $v1, 84($sp)
	sub $v0, $t2, $v1
	move $t3 $v0
	move $v1 $t3
	sw $v1, 88($sp)
	lw $v0, 84($sp)
	lw $v1, 88($sp)
	add $v0, $v0, $v1
	move $t5 $v0
	li $t6 1
	sub $v0, $t6, $t5
	move $t7 $v0
	move $v1 $t7
	sw $v1, 92($sp)
	lw $v0, 88($sp)
	lw $v1, 92($sp)
	sub $v0, $v0, $v1
	move $t9 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $t9
	move $s2 $v0
	li $s0 1
	sub $v0, $s0, $s2
	move $s1 $v0
	move $v1 $s1
	sw $v1, 96($sp)
	lw $v0, 92($sp)
	lw $v1, 96($sp)
	add $v0, $v0, $v1
	move $s3 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $s3
	move $s5 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s5
	move $s6 $v0
	li $s7 1
	sub $v0, $s7, $s6
	move $t0 $v0
	move $v1 $t0
	sw $v1, 100($sp)
	lw $v0, 96($sp)
	lw $v1, 100($sp)
	sub $v0, $v0, $v1
	move $t3 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t3
	move $t5 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t5
	move $t6 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $t6
	move $t7 $v0
	li $t9 1
	sub $v0, $t9, $t7
	move $s2 $v0
	move $v1 $s2
	sw $v1, 104($sp)
	lw $v0, 100($sp)
	lw $v1, 104($sp)
	add $v0, $v0, $v1
	move $s1 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $s1
	move $s3 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $s3
	move $s5 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $s5
	move $s6 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s6
	move $s7 $v0
	li $t0 1
	sub $v0, $t0, $s7
	move $t3 $v0
	move $v1 $t3
	sw $v1, 108($sp)
	lw $v0, 104($sp)
	lw $v1, 108($sp)
	sub $v0, $v0, $v1
	move $t6 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t6
	move $t7 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t7
	move $t9 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t9
	move $s2 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $s2
	move $s1 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s1
	move $s3 $v0
	li $s5 1
	sub $v0, $s5, $s3
	move $s6 $v0
	move $v1 $s6
	sw $v1, 112($sp)
	lw $v0, 108($sp)
	lw $v1, 112($sp)
	add $v0, $v0, $v1
	move $t0 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t0
	move $t3 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t3
	move $t6 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t6
	move $t7 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t7
	move $t9 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t9
	move $s2 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s2
	move $s1 $v0
	li $s3 1
	sub $v0, $s3, $s1
	move $s5 $v0
	move $v1 $s5
	sw $v1, 116($sp)
	lw $v0, 112($sp)
	lw $v1, 116($sp)
	sub $v0, $v0, $v1
	move $t0 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $t0
	move $t3 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t3
	move $t6 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t6
	move $t7 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t7
	move $t9 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t9
	move $s2 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $s2
	move $s1 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s1
	move $s3 $v0
	li $s5 1
	sub $v0, $s5, $s3
	move $t0 $v0
	move $v1 $t0
	sw $v1, 120($sp)
	lw $v0, 116($sp)
	lw $v1, 120($sp)
	add $v0, $v0, $v1
	move $t6 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $t6
	move $t7 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $t7
	move $t9 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t9
	move $s2 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $s2
	move $s1 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $s1
	move $s3 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $s3
	move $s5 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $t0
	move $t6 $v0
	li $t7 1
	sub $v0, $t7, $t6
	move $t9 $v0
	move $v1 $t9
	sw $v1, 124($sp)
	lw $v0, 120($sp)
	lw $v1, 124($sp)
	sub $v0, $v0, $v1
	move $s1 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $s1
	move $s3 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $s3
	move $s5 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t0
	move $t6 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t6
	move $t7 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t7
	move $t9 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t9
	move $s1 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $s1
	move $s3 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s3
	move $s5 $v0
	li $t0 1
	sub $v0, $t0, $s5
	move $t6 $v0
	move $v1 $t6
	sw $v1, 128($sp)
	lw $v0, 124($sp)
	lw $v1, 128($sp)
	add $v0, $v0, $v1
	move $t9 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $t9
	move $s1 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $s1
	move $s3 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $s3
	move $s5 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t0
	move $t6 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t6
	move $t9 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t9
	move $s1 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $s1
	move $s3 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $s3
	move $s5 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	li $t6 1
	sub $v0, $t6, $t0
	move $t9 $v0
	move $v1 $t9
	sw $v1, 132($sp)
	lw $v0, 128($sp)
	lw $v1, 132($sp)
	sub $v0, $v0, $v1
	move $s3 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $s3
	move $s5 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $t0
	move $t6 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $t6
	move $t9 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $t9
	move $s3 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $s3
	move $s5 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t0
	move $t6 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t6
	move $t9 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t9
	move $s3 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s3
	move $s5 $v0
	li $t0 1
	sub $v0, $t0, $s5
	move $t6 $v0
	move $v1 $t6
	sw $v1, 136($sp)
	lw $v0, 132($sp)
	lw $v1, 136($sp)
	add $v0, $v0, $v1
	move $s3 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $s3
	move $s5 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $t0
	move $t6 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $t6
	move $s3 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $s3
	move $s5 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t0
	move $t6 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t6
	move $s3 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $s3
	move $s5 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t0
	move $t6 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $t6
	move $s3 $v0
	li $s5 1
	sub $v0, $s5, $s3
	move $t0 $v0
	move $v1 $t0
	sw $v1, 140($sp)
	lw $v0, 136($sp)
	lw $v1, 140($sp)
	sub $v0, $v0, $v1
	move $s3 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $s3
	move $s5 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $t0
	move $s3 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $s3
	move $s5 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $t0
	move $s3 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $s3
	move $s5 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t0
	move $s3 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $s3
	move $s5 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t0
	move $s3 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s3
	move $s5 $v0
	li $t0 1
	sub $v0, $t0, $s5
	move $s3 $v0
	move $v1 $s3
	sw $v1, 144($sp)
	lw $v0, 140($sp)
	lw $v1, 144($sp)
	add $v0, $v0, $v1
	move $t0 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $t0
	move $s3 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $s3
	move $t0 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $t0
	move $s3 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $s3
	move $t0 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $t0
	move $s3 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $s3
	move $t0 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $t0
	move $s3 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $s3
	move $t0 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t0
	move $s3 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $s3
	move $t0 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t0
	move $s3 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $s3
	move $t0 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t0
	move $s3 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s3
	move $t0 $v0
	li $s3 1
	sub $v0, $s3, $t0
	move $t1 $v0
	move $v1 $t1
	sw $v1, 148($sp)
	lw $v0, 144($sp)
	lw $v1, 148($sp)
	sub $v0, $v0, $v1
	move $s3 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $s3
	move $t1 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $t1
	move $s3 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $s3
	move $t1 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $t1
	move $s3 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $s3
	move $t1 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $t1
	move $s3 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $s3
	move $t1 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $t1
	move $s3 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $s3
	move $t1 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t1
	move $s3 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $s3
	move $t1 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t1
	move $s3 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $s3
	move $t1 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t1
	move $s3 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s3
	move $t1 $v0
	li $s3 1
	sub $v0, $s3, $t1
	move $t4 $v0
	move $v1 $t4
	sw $v1, 152($sp)
	lw $v0, 148($sp)
	lw $v1, 152($sp)
	add $v0, $v0, $v1
	move $s3 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $s3
	move $t4 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $t4
	move $s3 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $s3
	move $t4 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $t4
	move $s3 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $s3
	move $t4 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $t4
	move $s3 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $s3
	move $t4 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $t4
	move $s3 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $s3
	move $t4 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $t4
	move $s3 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $s3
	move $t4 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t4
	move $s3 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $s3
	move $t4 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t4
	move $s3 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $s3
	move $t4 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $t4
	move $s3 $v0
	li $t4 1
	sub $v0, $t4, $s3
	move $t8 $v0
	move $v1 $t8
	sw $v1, 156($sp)
	lw $v0, 152($sp)
	lw $v1, 156($sp)
	sub $v0, $v0, $v1
	move $t4 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $t4
	move $t8 $v0
	li $t4 1
	sub $v0, $t4, $t8
	move $s4 $v0
	move $v1 $s4
	sw $v1, 160($sp)
	lw $v0, 156($sp)
	lw $v1, 160($sp)
	add $v0, $v0, $v1
	move $t4 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $t4
	move $s4 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $s4
	move $t4 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $t4
	move $s4 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $s4
	move $t4 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $t4
	move $s4 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $s4
	move $t4 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $t4
	move $s4 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $s4
	move $t4 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $t4
	move $s4 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $s4
	move $t4 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $t4
	move $s4 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $s4
	move $t4 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t4
	move $s4 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $s4
	move $t4 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t4
	move $s4 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $s4
	move $t4 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t4
	move $s4 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s4
	move $t4 $v0
	li $s4 1
	sub $v0, $s4, $t4
	move $t2 $v0
	move $v1 $t2
	sw $v1, 164($sp)
	lw $v0, 160($sp)
	lw $v1, 164($sp)
	sub $v0, $v0, $v1
	move $s4 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $s4
	move $t2 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $t2
	move $s4 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $s4
	move $t2 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $t2
	move $s4 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $s4
	move $t2 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $t2
	move $s4 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $s4
	move $t2 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $t2
	move $s4 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $s4
	move $t2 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $t2
	move $s4 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $s4
	move $t2 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $t2
	move $s4 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $s4
	move $t2 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t2
	move $s4 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $s4
	move $t2 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t2
	move $s4 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $s4
	move $t2 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t2
	move $s4 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s4
	move $t2 $v0
	li $s4 1
	sub $v0, $s4, $t2
	move $s0 $v0
	move $v1 $s0
	sw $v1, 168($sp)
	lw $v0, 164($sp)
	lw $v1, 168($sp)
	add $v0, $v0, $v1
	move $s4 $v0
	lw $v0, 160($sp)
	sub $v0, $v0, $s4
	move $s0 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $s0
	move $s4 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $s4
	move $s0 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $s0
	move $s4 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $s4
	move $s0 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $s0
	move $s4 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $s4
	move $s0 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $s0
	move $s4 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $s4
	move $s0 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $s0
	move $s4 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $s4
	move $s0 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $s0
	move $s4 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $s4
	move $s0 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $s0
	move $s4 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $s4
	move $s0 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $s0
	move $s4 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $s4
	move $s0 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $s0
	move $s4 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $s4
	move $s0 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s0
	move $s4 $v0
	li $s0 1
	sub $v0, $s0, $s4
	move $t5 $v0
	move $v1 $t5
	sw $v1, 172($sp)
	lw $v0, 168($sp)
	lw $v1, 172($sp)
	sub $v0, $v0, $v1
	move $s0 $v0
	lw $v0, 164($sp)
	add $v0, $v0, $s0
	move $t5 $v0
	lw $v0, 160($sp)
	sub $v0, $v0, $t5
	move $s0 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $s0
	move $t5 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $t5
	move $s0 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $s0
	move $t5 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $t5
	move $s0 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $s0
	move $t5 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $t5
	move $s0 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $s0
	move $t5 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $t5
	move $s0 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $s0
	move $t5 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $t5
	move $s0 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $s0
	move $t5 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $t5
	move $s0 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $s0
	move $t5 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t5
	move $s0 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $s0
	move $t5 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t5
	move $s0 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $s0
	move $t5 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t5
	move $s0 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s0
	move $t5 $v0
	li $s0 1
	sub $v0, $s0, $t5
	move $s7 $v0
	move $t5 $s7
	lw $v0, 172($sp)
	add $v0, $v0, $t5
	move $s0 $v0
	lw $v0, 168($sp)
	sub $v0, $v0, $s0
	move $s7 $v0
	lw $v0, 164($sp)
	add $v0, $v0, $s7
	move $s0 $v0
	lw $v0, 160($sp)
	sub $v0, $v0, $s0
	move $s7 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $s7
	move $s0 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $s0
	move $s7 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $s7
	move $s0 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $s0
	move $s7 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $s7
	move $s0 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $s0
	move $s7 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $s7
	move $s0 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $s0
	move $s7 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $s7
	move $s0 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $s0
	move $s7 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $s7
	move $s0 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $s0
	move $s7 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $s7
	move $s0 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $s0
	move $s7 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $s7
	move $s0 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $s0
	move $s7 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $s7
	move $s0 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $s0
	move $s7 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s7
	move $s0 $v0
	li $s7 1
	sub $v0, $s7, $s0
	move $s6 $v0
	move $s0 $s6
	sub $v0, $t5, $s0
	move $s7 $v0
	lw $v0, 172($sp)
	add $v0, $v0, $s7
	move $s6 $v0
	lw $v0, 168($sp)
	sub $v0, $v0, $s6
	move $s7 $v0
	lw $v0, 164($sp)
	add $v0, $v0, $s7
	move $s6 $v0
	lw $v0, 160($sp)
	sub $v0, $v0, $s6
	move $s7 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $s7
	move $s6 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $s6
	move $s7 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $s7
	move $s6 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $s6
	move $s7 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $s7
	move $s6 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $s6
	move $s7 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $s7
	move $s6 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $s6
	move $s7 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $s7
	move $s6 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $s6
	move $s7 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $s7
	move $s6 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $s6
	move $s7 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $s7
	move $s6 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $s6
	move $s7 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $s7
	move $s6 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $s6
	move $s7 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $s7
	move $s6 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $s6
	move $s7 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s7
	move $s6 $v0
	li $s7 1
	sub $v0, $s7, $s6
	move $t3 $v0
	move $s6 $t3
	add $v0, $s0, $s6
	move $s7 $v0
	sub $v0, $t5, $s7
	move $t3 $v0
	lw $v0, 172($sp)
	add $v0, $v0, $t3
	move $s7 $v0
	lw $v0, 168($sp)
	sub $v0, $v0, $s7
	move $t3 $v0
	lw $v0, 164($sp)
	add $v0, $v0, $t3
	move $s7 $v0
	lw $v0, 160($sp)
	sub $v0, $v0, $s7
	move $t3 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $t3
	move $s7 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $s7
	move $t3 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $t3
	move $s7 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $s7
	move $t3 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $t3
	move $s7 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $s7
	move $t3 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $t3
	move $s7 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $s7
	move $t3 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $t3
	move $s7 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $s7
	move $t3 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $t3
	move $s7 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $s7
	move $t3 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $t3
	move $s7 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $s7
	move $t3 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t3
	move $s7 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $s7
	move $t3 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t3
	move $s7 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $s7
	move $t3 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $t3
	move $s7 $v0
	li $t3 1
	sub $v0, $t3, $s7
	move $s2 $v0
	move $s7 $s2
	sub $v0, $s6, $s7
	move $t3 $v0
	add $v0, $s0, $t3
	move $s2 $v0
	sub $v0, $t5, $s2
	move $t3 $v0
	lw $v0, 172($sp)
	add $v0, $v0, $t3
	move $s2 $v0
	lw $v0, 168($sp)
	sub $v0, $v0, $s2
	move $t3 $v0
	lw $v0, 164($sp)
	add $v0, $v0, $t3
	move $s2 $v0
	lw $v0, 160($sp)
	sub $v0, $v0, $s2
	move $t3 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $t3
	move $s2 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $s2
	move $t3 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $t3
	move $s2 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $s2
	move $t3 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $t3
	move $s2 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $s2
	move $t3 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $t3
	move $s2 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $s2
	move $t3 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $t3
	move $s2 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $s2
	move $t3 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $t3
	move $s2 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $s2
	move $t3 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $t3
	move $s2 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $s2
	move $t3 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t3
	move $s2 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $s2
	move $t3 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t3
	move $s2 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $s2
	move $t3 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $t3
	move $s2 $v0
	li $t3 1
	sub $v0, $t3, $s2
	move $t7 $v0
	move $s2 $t7
	add $v0, $s7, $s2
	move $t3 $v0
	sub $v0, $s6, $t3
	move $t7 $v0
	add $v0, $s0, $t7
	move $t3 $v0
	sub $v0, $t5, $t3
	move $t7 $v0
	lw $v0, 172($sp)
	add $v0, $v0, $t7
	move $t3 $v0
	lw $v0, 168($sp)
	sub $v0, $v0, $t3
	move $t7 $v0
	lw $v0, 164($sp)
	add $v0, $v0, $t7
	move $t3 $v0
	lw $v0, 160($sp)
	sub $v0, $v0, $t3
	move $t7 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $t7
	move $t3 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $t3
	move $t7 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $t7
	move $t3 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $t3
	move $t7 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $t7
	move $t3 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $t3
	move $t7 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $t7
	move $t3 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $t3
	move $t7 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $t7
	move $t3 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $t3
	move $t7 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $t7
	move $t3 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $t3
	move $t7 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $t7
	move $t3 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t3
	move $t7 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t7
	move $t3 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t3
	move $t7 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t7
	move $t3 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t3
	move $t7 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $t7
	move $t3 $v0
	li $t7 1
	sub $v0, $t7, $t3
	move $s1 $v0
	move $t3 $s1
	sub $v0, $s2, $t3
	move $t7 $v0
	add $v0, $s7, $t7
	move $s1 $v0
	sub $v0, $s6, $s1
	move $t7 $v0
	add $v0, $s0, $t7
	move $s1 $v0
	sub $v0, $t5, $s1
	move $t7 $v0
	lw $v0, 172($sp)
	add $v0, $v0, $t7
	move $s1 $v0
	lw $v0, 168($sp)
	sub $v0, $v0, $s1
	move $t7 $v0
	lw $v0, 164($sp)
	add $v0, $v0, $t7
	move $s1 $v0
	lw $v0, 160($sp)
	sub $v0, $v0, $s1
	move $t7 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $t7
	move $s1 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $s1
	move $t7 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $t7
	move $s1 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $s1
	move $t7 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $t7
	move $s1 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $s1
	move $t7 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $t7
	move $s1 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $s1
	move $t7 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $t7
	move $s1 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $s1
	move $t7 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $t7
	move $s1 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $s1
	move $t7 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $t7
	move $s1 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $s1
	move $t7 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t7
	move $s1 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $s1
	move $t7 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t7
	move $s1 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $s1
	move $t7 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $t7
	move $s1 $v0
	li $t7 1
	sub $v0, $t7, $s1
	move $t9 $v0
	move $s1 $t9
	add $v0, $t3, $s1
	move $t7 $v0
	sub $v0, $s2, $t7
	move $t9 $v0
	add $v0, $s7, $t9
	move $t7 $v0
	sub $v0, $s6, $t7
	move $t9 $v0
	add $v0, $s0, $t9
	move $t7 $v0
	sub $v0, $t5, $t7
	move $t9 $v0
	lw $v0, 172($sp)
	add $v0, $v0, $t9
	move $t7 $v0
	lw $v0, 168($sp)
	sub $v0, $v0, $t7
	move $t9 $v0
	lw $v0, 164($sp)
	add $v0, $v0, $t9
	move $t7 $v0
	lw $v0, 160($sp)
	sub $v0, $v0, $t7
	move $t9 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $t9
	move $t7 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $t7
	move $t9 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $t9
	move $t7 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $t7
	move $t9 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $t9
	move $t7 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $t7
	move $t9 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $t9
	move $t7 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $t7
	move $t9 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $t9
	move $t7 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $t7
	move $t9 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $t9
	move $t7 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $t7
	move $t9 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $t9
	move $t7 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t7
	move $t9 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t9
	move $t7 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t7
	move $t9 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t9
	move $t7 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t7
	move $t9 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $t9
	move $t7 $v0
	li $t9 1
	sub $v0, $t9, $t7
	move $t6 $v0
	move $t7 $t6
	sub $v0, $s1, $t7
	move $t9 $v0
	add $v0, $t3, $t9
	move $t6 $v0
	sub $v0, $s2, $t6
	move $t9 $v0
	add $v0, $s7, $t9
	move $t6 $v0
	sub $v0, $s6, $t6
	move $t9 $v0
	add $v0, $s0, $t9
	move $t6 $v0
	sub $v0, $t5, $t6
	move $t9 $v0
	lw $v0, 172($sp)
	add $v0, $v0, $t9
	move $t6 $v0
	lw $v0, 168($sp)
	sub $v0, $v0, $t6
	move $t9 $v0
	lw $v0, 164($sp)
	add $v0, $v0, $t9
	move $t6 $v0
	lw $v0, 160($sp)
	sub $v0, $v0, $t6
	move $t9 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $t9
	move $t6 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $t6
	move $t9 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $t9
	move $t6 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $t6
	move $t9 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $t9
	move $t6 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $t6
	move $t9 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $t9
	move $t6 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $t6
	move $t9 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $t9
	move $t6 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $t6
	move $t9 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $t9
	move $t6 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $t6
	move $t9 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $t9
	move $t6 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t6
	move $t9 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t9
	move $t6 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t6
	move $t9 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t9
	move $t6 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t6
	move $t9 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $t9
	move $t6 $v0
	li $t9 1
	sub $v0, $t9, $t6
	move $s5 $v0
	move $t6 $s5
	add $v0, $t7, $t6
	move $t9 $v0
	sub $v0, $s1, $t9
	move $s5 $v0
	add $v0, $t3, $s5
	move $t9 $v0
	sub $v0, $s2, $t9
	move $s5 $v0
	add $v0, $s7, $s5
	move $t9 $v0
	sub $v0, $s6, $t9
	move $s5 $v0
	add $v0, $s0, $s5
	move $t9 $v0
	sub $v0, $t5, $t9
	move $s5 $v0
	lw $v0, 172($sp)
	add $v0, $v0, $s5
	move $t9 $v0
	lw $v0, 168($sp)
	sub $v0, $v0, $t9
	move $s5 $v0
	lw $v0, 164($sp)
	add $v0, $v0, $s5
	move $t9 $v0
	lw $v0, 160($sp)
	sub $v0, $v0, $t9
	move $s5 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $s5
	move $t9 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $t9
	move $s5 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $s5
	move $t9 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $t9
	move $s5 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $s5
	move $t9 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $t9
	move $s5 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $s5
	move $t9 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $t9
	move $s5 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $s5
	move $t9 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $t9
	move $s5 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $s5
	move $t9 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $t9
	move $s5 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $s5
	move $t9 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t9
	move $s5 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $s5
	move $t9 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t9
	move $s5 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $s5
	move $t9 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t9
	move $s5 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s5
	move $t9 $v0
	li $s5 1
	sub $v0, $s5, $t9
	move $t0 $v0
	move $t9 $t0
	sub $v0, $t6, $t9
	move $s5 $v0
	add $v0, $t7, $s5
	move $t0 $v0
	sub $v0, $s1, $t0
	move $s5 $v0
	add $v0, $t3, $s5
	move $t0 $v0
	sub $v0, $s2, $t0
	move $s5 $v0
	add $v0, $s7, $s5
	move $t0 $v0
	sub $v0, $s6, $t0
	move $s5 $v0
	add $v0, $s0, $s5
	move $t0 $v0
	sub $v0, $t5, $t0
	move $s5 $v0
	lw $v0, 172($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 168($sp)
	sub $v0, $v0, $t0
	move $s5 $v0
	lw $v0, 164($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 160($sp)
	sub $v0, $v0, $t0
	move $s5 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $t0
	move $s5 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $t0
	move $s5 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $t0
	move $s5 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $t0
	move $s5 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $t0
	move $s5 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $t0
	move $s5 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t0
	move $s5 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t0
	move $s5 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t0
	move $s5 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s5
	move $t0 $v0
	li $s5 1
	sub $v0, $s5, $t0
	move $t1 $v0
	move $t0 $t1
	add $v0, $t9, $t0
	move $s5 $v0
	sub $v0, $t6, $s5
	move $t1 $v0
	add $v0, $t7, $t1
	move $s5 $v0
	sub $v0, $s1, $s5
	move $t1 $v0
	add $v0, $t3, $t1
	move $s5 $v0
	sub $v0, $s2, $s5
	move $t1 $v0
	add $v0, $s7, $t1
	move $s5 $v0
	sub $v0, $s6, $s5
	move $t1 $v0
	add $v0, $s0, $t1
	move $s5 $v0
	sub $v0, $t5, $s5
	move $t1 $v0
	lw $v0, 172($sp)
	add $v0, $v0, $t1
	move $s5 $v0
	lw $v0, 168($sp)
	sub $v0, $v0, $s5
	move $t1 $v0
	lw $v0, 164($sp)
	add $v0, $v0, $t1
	move $s5 $v0
	lw $v0, 160($sp)
	sub $v0, $v0, $s5
	move $t1 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $t1
	move $s5 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $s5
	move $t1 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $t1
	move $s5 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $s5
	move $t1 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $t1
	move $s5 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $s5
	move $t1 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $t1
	move $s5 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $s5
	move $t1 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $t1
	move $s5 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $s5
	move $t1 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $t1
	move $s5 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $s5
	move $t1 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $t1
	move $s5 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $s5
	move $t1 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t1
	move $s5 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $s5
	move $t1 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t1
	move $s5 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $s5
	move $t1 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $t1
	move $s5 $v0
	li $t1 1
	sub $v0, $t1, $s5
	move $s3 $v0
	move $s5 $s3
	sub $v0, $t0, $s5
	move $t1 $v0
	add $v0, $t9, $t1
	move $s3 $v0
	sub $v0, $t6, $s3
	move $t1 $v0
	add $v0, $t7, $t1
	move $s3 $v0
	sub $v0, $s1, $s3
	move $t1 $v0
	add $v0, $t3, $t1
	move $s3 $v0
	sub $v0, $s2, $s3
	move $t1 $v0
	add $v0, $s7, $t1
	move $s3 $v0
	sub $v0, $s6, $s3
	move $t1 $v0
	add $v0, $s0, $t1
	move $s3 $v0
	sub $v0, $t5, $s3
	move $t1 $v0
	lw $v0, 172($sp)
	add $v0, $v0, $t1
	move $s3 $v0
	lw $v0, 168($sp)
	sub $v0, $v0, $s3
	move $t1 $v0
	lw $v0, 164($sp)
	add $v0, $v0, $t1
	move $s3 $v0
	lw $v0, 160($sp)
	sub $v0, $v0, $s3
	move $t1 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $t1
	move $s3 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $s3
	move $t1 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $t1
	move $s3 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $s3
	move $t1 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $t1
	move $s3 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $s3
	move $t1 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $t1
	move $s3 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $s3
	move $t1 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $t1
	move $s3 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $s3
	move $t1 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $t1
	move $s3 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $s3
	move $t1 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $t1
	move $s3 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $s3
	move $t1 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t1
	move $s3 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $s3
	move $t1 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t1
	move $s3 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $s3
	move $t1 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $t1
	move $s3 $v0
	li $t1 1
	sub $v0, $t1, $s3
	move $t8 $v0
	move $s3 $t8
	add $v0, $s5, $s3
	move $t1 $v0
	sub $v0, $t0, $t1
	move $t8 $v0
	add $v0, $t9, $t8
	move $t1 $v0
	sub $v0, $t6, $t1
	move $t8 $v0
	add $v0, $t7, $t8
	move $t1 $v0
	sub $v0, $s1, $t1
	move $t8 $v0
	add $v0, $t3, $t8
	move $t1 $v0
	sub $v0, $s2, $t1
	move $t8 $v0
	add $v0, $s7, $t8
	move $t1 $v0
	sub $v0, $s6, $t1
	move $t8 $v0
	add $v0, $s0, $t8
	move $t1 $v0
	sub $v0, $t5, $t1
	move $t8 $v0
	lw $v0, 172($sp)
	add $v0, $v0, $t8
	move $t1 $v0
	lw $v0, 168($sp)
	sub $v0, $v0, $t1
	move $t8 $v0
	lw $v0, 164($sp)
	add $v0, $v0, $t8
	move $t1 $v0
	lw $v0, 160($sp)
	sub $v0, $v0, $t1
	move $t8 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $t8
	move $t1 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $t1
	move $t8 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $t8
	move $t1 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $t1
	move $t8 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $t8
	move $t1 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $t1
	move $t8 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $t8
	move $t1 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $t1
	move $t8 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $t8
	move $t1 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $t1
	move $t8 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $t8
	move $t1 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $t1
	move $t8 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $t8
	move $t1 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t1
	move $t8 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t8
	move $t1 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t1
	move $t8 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t8
	move $t1 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t1
	move $t8 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $t8
	move $t1 $v0
	li $t8 1
	sub $v0, $t8, $t1
	move $t4 $v0
	move $t1 $t4
	sub $v0, $s3, $t1
	move $t8 $v0
	add $v0, $s5, $t8
	move $t4 $v0
	sub $v0, $t0, $t4
	move $t8 $v0
	add $v0, $t9, $t8
	move $t4 $v0
	sub $v0, $t6, $t4
	move $t8 $v0
	add $v0, $t7, $t8
	move $t4 $v0
	sub $v0, $s1, $t4
	move $t8 $v0
	add $v0, $t3, $t8
	move $t4 $v0
	sub $v0, $s2, $t4
	move $t8 $v0
	add $v0, $s7, $t8
	move $t4 $v0
	sub $v0, $s6, $t4
	move $t8 $v0
	add $v0, $s0, $t8
	move $t4 $v0
	sub $v0, $t5, $t4
	move $t8 $v0
	lw $v0, 172($sp)
	add $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 168($sp)
	sub $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 164($sp)
	add $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 160($sp)
	sub $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t8
	move $t4 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t4
	move $t8 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $t8
	move $t4 $v0
	li $t8 1
	sub $v0, $t8, $t4
	move $t2 $v0
	move $t4 $t2
	add $v0, $t1, $t4
	move $t8 $v0
	sub $v0, $s3, $t8
	move $t2 $v0
	add $v0, $s5, $t2
	move $t8 $v0
	sub $v0, $t0, $t8
	move $t2 $v0
	add $v0, $t9, $t2
	move $t8 $v0
	sub $v0, $t6, $t8
	move $t2 $v0
	add $v0, $t7, $t2
	move $t8 $v0
	sub $v0, $s1, $t8
	move $t2 $v0
	add $v0, $t3, $t2
	move $t8 $v0
	sub $v0, $s2, $t8
	move $t2 $v0
	add $v0, $s7, $t2
	move $t8 $v0
	sub $v0, $s6, $t8
	move $t2 $v0
	add $v0, $s0, $t2
	move $t8 $v0
	sub $v0, $t5, $t8
	move $t2 $v0
	lw $v0, 172($sp)
	add $v0, $v0, $t2
	move $t8 $v0
	lw $v0, 168($sp)
	sub $v0, $v0, $t8
	move $t2 $v0
	lw $v0, 164($sp)
	add $v0, $v0, $t2
	move $t8 $v0
	lw $v0, 160($sp)
	sub $v0, $v0, $t8
	move $t2 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $t2
	move $t8 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $t8
	move $t2 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $t2
	move $t8 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $t8
	move $t2 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $t2
	move $t8 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $t8
	move $t2 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $t2
	move $t8 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $t8
	move $t2 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $t2
	move $t8 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $t8
	move $t2 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $t2
	move $t8 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $t8
	move $t2 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $t2
	move $t8 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t8
	move $t2 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t2
	move $t8 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t8
	move $t2 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t2
	move $t8 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $t8
	move $t2 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $t2
	move $t8 $v0
	li $t2 1
	sub $v0, $t2, $t8
	move $s4 $v0
	move $t8 $s4
	sub $v0, $t4, $t8
	move $t2 $v0
	add $v0, $t1, $t2
	move $s4 $v0
	sub $v0, $s3, $s4
	move $t4 $v0
	add $v0, $s5, $t4
	move $t8 $v0
	sub $v0, $t0, $t8
	move $t1 $v0
	add $v0, $t9, $t1
	move $t2 $v0
	sub $v0, $t6, $t2
	move $s3 $v0
	add $v0, $t7, $s3
	move $s4 $v0
	sub $v0, $s1, $s4
	move $s5 $v0
	add $v0, $t3, $s5
	move $t4 $v0
	sub $v0, $s2, $t4
	move $t0 $v0
	add $v0, $s7, $t0
	move $t8 $v0
	sub $v0, $s6, $t8
	move $t9 $v0
	add $v0, $s0, $t9
	move $t1 $v0
	sub $v0, $t5, $t1
	move $t6 $v0
	lw $v0, 172($sp)
	add $v0, $v0, $t6
	move $t2 $v0
	lw $v0, 168($sp)
	sub $v0, $v0, $t2
	move $t7 $v0
	lw $v0, 164($sp)
	add $v0, $v0, $t7
	move $s3 $v0
	lw $v0, 160($sp)
	sub $v0, $v0, $s3
	move $s1 $v0
	lw $v0, 156($sp)
	add $v0, $v0, $s1
	move $s4 $v0
	lw $v0, 152($sp)
	sub $v0, $v0, $s4
	move $t3 $v0
	lw $v0, 148($sp)
	add $v0, $v0, $t3
	move $s5 $v0
	lw $v0, 144($sp)
	sub $v0, $v0, $s5
	move $s2 $v0
	lw $v0, 140($sp)
	add $v0, $v0, $s2
	move $t4 $v0
	lw $v0, 136($sp)
	sub $v0, $v0, $t4
	move $s7 $v0
	lw $v0, 132($sp)
	add $v0, $v0, $s7
	move $t0 $v0
	lw $v0, 128($sp)
	sub $v0, $v0, $t0
	move $s6 $v0
	lw $v0, 124($sp)
	add $v0, $v0, $s6
	move $t8 $v0
	lw $v0, 120($sp)
	sub $v0, $v0, $t8
	move $s0 $v0
	lw $v0, 116($sp)
	add $v0, $v0, $s0
	move $t9 $v0
	lw $v0, 112($sp)
	sub $v0, $v0, $t9
	move $t5 $v0
	lw $v0, 108($sp)
	add $v0, $v0, $t5
	move $t1 $v0
	lw $v0, 104($sp)
	sub $v0, $v0, $t1
	move $t6 $v0
	lw $v0, 100($sp)
	add $v0, $v0, $t6
	move $t2 $v0
	lw $v0, 96($sp)
	sub $v0, $v0, $t2
	move $t7 $v0
	lw $v0, 92($sp)
	add $v0, $v0, $t7
	move $s3 $v0
	lw $v0, 88($sp)
	sub $v0, $v0, $s3
	move $s1 $v0
	lw $v0, 84($sp)
	add $v0, $v0, $s1
	move $s4 $v0
	li $t3 1
	sub $v0, $t3, $s4
	move $s5 $v0
	move $s2 $s5
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
	lw $fp, 188($sp)
	addu $sp, $sp, 196
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
