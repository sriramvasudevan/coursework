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
	jalr Create_LL
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
	.globl Create_Element
Create_Element:
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
	li $a0 24
	jal _halloc
	move $v0 $v0
	move $t1 $v0
	move $t2 $t1
	move $t3 $t2
	la $t4 Element_GetAge
	sw $t4, 0($t3)
	move $t5 $t2
	la $t6 Element_Init
	sw $t6, 4($t5)
	move $t7 $t2
	la $t8 Element_Equal
	sw $t8, 8($t7)
	move $t9 $t2
	la $s0 Element_Compare
	sw $s0, 12($t9)
	move $s2 $t2
	la $s3 Element_GetMarried
	sw $s3, 16($s2)
	move $s4 $t2
	la $s1 Element_GetSalary
	sw $s1, 20($s4)
	li $a0 16
	jal _halloc
	move $v0 $v0
	move $s5 $v0
	move $s6 $s5
	move $s7 $s6
	move $t0 $t2
	sw $t0, 0($s7)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t1 $v0
	move $t3 $t1
	li $t3 0
	move $t4 $s6
	move $t5 $t3
	sw $t5, 4($t4)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t6 $v0
	move $t7 $t6
	li $t7 0
	move $t8 $s6
	move $t9 $t7
	sw $t9, 8($t8)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s0 $v0
	move $s2 $s0
	li $s2 0
	move $s3 $s6
	move $s4 $s2
	sw $s4, 12($s3)
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
	.globl Element_Init
Element_Init:
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
	move $s1 $a0
	move $t2 $a1
	move $s5 $a2
	move $s7 $a3
	move $t0 $t2
	move $t1 $s1
	move $t3 $t0
	sw $t3, 4($t1)
	move $t4 $s5
	move $t5 $s1
	move $t6 $t4
	sw $t6, 12($t5)
	move $t7 $s7
	move $t8 $s1
	move $t9 $t7
	sw $t9, 8($t8)
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
	.globl Element_GetAge
Element_GetAge:
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
	move $s2 $s3
	lw $s4 4($s2)
	move $s6 $s4
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
	.globl Element_GetSalary
Element_GetSalary:
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
	move $t0 $t2
	lw $t1 12($t0)
	move $t3 $t1
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
	.globl Element_GetMarried
Element_GetMarried:
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
	move $t4 $a0
	move $s5 $t4
	lw $t5 8($s5)
	move $t6 $t5
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
	.globl Element_Equal
Element_Equal:
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
	move $t7 $a0
	move $s7 $a1
	li $s1 1
	move $t8 $s1
	move $t9 $s7
	move $s0 $t9
	lw $s3 0($s0)
	move $s2 $s3
	lw $s4 0($s2)
	move $s6 $t9
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
	move $t2 $v0
	move $t0 $t2
	move $t1 $t0
	move $t3 $t7
	move $t4 $t3
	lw $s5 0($t4)
	move $t5 $s5
	lw $t6 12($t5)
	move $s1 $t1
	move $s0 $t7
	lw $s3 4($s0)
	move $s2 $s3
	move $t9 $t3
	move $s4 $s1
	move $s6 $s2
	move $a0 $t9
	move $a1 $s4
	move $a2 $s6
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
	move $t2 $v0
	li $t0 1
	sub $v0, $t0, $t2
	move $t4 $v0
	move $s5 $t4
	beqz $s5 L7
	li $t5 0
	move $t8 $t5
	b L16
L7:
	nop
	move $t1 $s7
	move $s0 $t1
	lw $s3 0($s0)
	move $t3 $s3
	lw $s1 20($t3)
	move $s2 $t1
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
	move $t6 $v0
	move $t9 $t6
	move $s4 $t9
	move $s6 $t7
	move $t2 $s6
	lw $t0 0($t2)
	move $t4 $t0
	lw $s5 12($t4)
	move $t5 $s4
	move $s0 $t7
	lw $s3 12($s0)
	move $t3 $s3
	move $t1 $s6
	move $s1 $t5
	move $s2 $t3
	move $a0 $t1
	move $a1 $s1
	move $a2 $s2
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
	li $t9 1
	sub $v0, $t9, $t6
	move $t2 $v0
	move $t0 $t2
	beqz $t0 L8
	li $t4 0
	move $t8 $t4
	b L15
L8:
	nop
	move $s4 $t7
	lw $s0 8($s4)
	move $s3 $s0
	beqz $s3 L11
	move $s6 $s7
	move $t5 $s6
	lw $t3 0($t5)
	move $s5 $t3
	lw $t1 16($s5)
	move $s1 $s6
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
	li $t6 1
	sub $v0, $t6, $s2
	move $t9 $v0
	move $t2 $t9
	beqz $t2 L9
	li $t0 0
	move $t8 $t0
	b L10
L9:
	nop
	li $t4 0
	move $t7 $t4
L10:
	nop
	b L14
L11:
	nop
	move $s4 $s7
	move $s0 $s4
	lw $s3 0($s0)
	move $t5 $s3
	lw $t3 16($t5)
	move $s5 $s4
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
	move $s6 $v0
	move $t1 $s6
	beqz $t1 L12
	li $s1 0
	move $t8 $s1
	b L13
L12:
	nop
	li $s2 0
	move $t7 $s2
L13:
	nop
L14:
	nop
L15:
	nop
L16:
	nop
	move $t6 $t8
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
	lw $fp, 504($sp)
	addu $sp, $sp, 512
	j $ra

	.text
	.globl Element_Compare
Element_Compare:
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
	move $t0 $a1
	move $t2 $a2
	li $t9 0
	move $t4 $t9
	move $s7 $t2
	add $v0, $s7, 1
	move $s0 $v0
	move $s3 $s0
	move $t5 $s3
	move $s4 $t0
	slt $v0, $s4, $t2
	move $t3 $v0
	move $s5 $t3
	beqz $s5 L17
	li $s6 0
	move $t4 $s6
	b L20
L17:
	nop
	move $t1 $t0
	slt $v0, $t1, $t5
	move $s1 $v0
	move $t7 $s1
	li $s2 1
	sub $v0, $s2, $t7
	move $t8 $v0
	move $t6 $t8
	beqz $t6 L18
	li $t9 0
	move $t4 $t9
	b L19
L18:
	nop
	li $s7 1
	move $t4 $s7
L19:
	nop
L20:
	nop
	move $s0 $t4
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
	.globl Create_List
Create_List:
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
	li $a0 40
	jal _halloc
	move $v0 $v0
	move $s3 $v0
	move $t2 $s3
	move $s4 $t2
	la $t3 List_GetNext
	sw $t3, 0($s4)
	move $s5 $t2
	la $s6 List_Search
	sw $s6, 4($s5)
	move $t0 $t2
	la $t5 List_Insert
	sw $t5, 8($t0)
	move $t1 $t2
	la $s1 List_InitNew
	sw $s1, 12($t1)
	move $t7 $t2
	la $s2 List_Init
	sw $s2, 16($t7)
	move $t8 $t2
	la $t6 List_GetElem
	sw $t6, 20($t8)
	move $t9 $t2
	la $s7 List_Delete
	sw $s7, 24($t9)
	move $t4 $t2
	la $s0 List_SetNext
	sw $s0, 28($t4)
	move $s3 $t2
	la $s4 List_Print
	sw $s4, 32($s3)
	move $t3 $t2
	la $s5 List_GetEnd
	sw $s5, 36($t3)
	li $a0 16
	jal _halloc
	move $v0 $v0
	move $s6 $v0
	move $t0 $s6
	move $t5 $t0
	move $t1 $t2
	sw $t1, 0($t5)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s1 $v0
	move $t7 $s1
	li $t7 0
	move $s2 $t0
	move $t8 $t7
	sw $t8, 4($s2)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $t6 $v0
	move $t9 $t6
	li $t9 0
	move $s7 $t0
	move $t4 $t9
	sw $t4, 8($s7)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s0 $v0
	move $s3 $s0
	li $s3 0
	move $s4 $t0
	move $t3 $s3
	sw $t3, 12($s4)
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
	.globl List_Init
List_Init:
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
	move $s5 $a0
	li $s6 1
	move $t2 $s5
	move $t5 $s6
	sw $t5, 12($t2)
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
	.globl List_InitNew
List_InitNew:
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
	move $t6 $a0
	move $t8 $a1
	move $s2 $a2
	move $t7 $a3
	move $s1 $t7
	move $t9 $t6
	move $s7 $s1
	sw $s7, 12($t9)
	move $t4 $t8
	move $s0 $t6
	move $s3 $t4
	sw $s3, 4($s0)
	move $s4 $s2
	move $t3 $t6
	move $t0 $s4
	sw $t0, 8($t3)
	li $s5 1
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
	.globl List_Insert
List_Insert:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 516
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
	move $t5 $a1
	move $s6 $t2
	move $t1 $s6
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
	jalr Create_List
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
	move $s1 $t7
	move $t9 $s1
	move $s7 $t9
	move $t8 $s7
	lw $t4 0($t8)
	move $s0 $t4
	lw $s3 12($s0)
	move $s2 $t5
	move $t6 $t1
	li $s4 0
	move $t3 $s7
	move $t0 $s2
	move $s5 $t6
	move $t2 $s4
	move $a0 $t3
	move $a1 $t0
	move $a2 $s5
	move $a3 $t2
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
	move $s6 $v0
	move $t7 $s6
	move $s1 $t7
	move $t8 $t9
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
	lw $fp, 508($sp)
	addu $sp, $sp, 516
	j $ra

	.text
	.globl List_SetNext
List_SetNext:
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
	move $t4 $a0
	move $s0 $a1
	move $t5 $s0
	move $t1 $t4
	move $s7 $t5
	sw $s7, 8($t1)
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
	.globl List_Delete
List_Delete:
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
	move $s4 $a1
	move $t6 $s3
	move $t3 $t6
	li $t0 0
	move $s5 $t0
	li $t2 0
	sub $v0, $t2, 1
	move $s6 $v0
	move $t7 $s6
	move $s1 $t7
	move $t9 $s3
	move $t8 $t9
	move $s0 $s3
	move $t4 $s0
	move $t5 $s3
	lw $t1 12($t5)
	move $s7 $t1
	move $s2 $s7
	move $t6 $s3
	lw $t0 4($t6)
	move $t2 $t0
	move $s6 $t2
L32:
	li $s0 0
	li $t7 1
	sub $v0, $t7, $s2
	move $t9 $v0
	move $t5 $t9
	move $t1 $t5
	beqz $t1 L33
	li $s7 1
	sub $v0, $s7, $s5
	move $s3 $v0
	move $t6 $s3
	move $t0 $t6
	beqz $t0 L33
	li $s0 1
L33:
	nop
	move $t2 $s0
	beqz $t2 L40
	move $t7 $s4
	move $t9 $t7
	lw $t5 0($t9)
	move $t1 $t5
	lw $s7 8($t1)
	move $s3 $s6
	move $t6 $t7
	move $t0 $s3
	move $a0 $t6
	move $a1 $t0
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
	move $s0 $v0
	move $t2 $s0
	beqz $t2 L36
	li $t9 1
	move $s5 $t9
	move $t5 $s1
	slt $v0, $t5, 0
	move $t1 $v0
	move $t7 $t1
	beqz $t7 L34
	move $s3 $t8
	move $s7 $s3
	lw $t6 0($s7)
	move $t0 $t6
	lw $s0 0($t0)
	move $t2 $s3
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
	move $t9 $v0
	move $t5 $t9
	move $t3 $t5
	b L35
L34:
	nop
	li $t1 0
	sub $v0, $t1, 555
	move $t7 $v0
	move $s7 $t7
	move $a0 $s7
	jal _print
	move $t6 $t4
	move $t0 $t6
	lw $s3 0($t0)
	move $s0 $s3
	lw $t2 28($s0)
	move $t9 $t8
	move $t5 $t9
	lw $t1 0($t5)
	move $t7 $t1
	lw $s7 0($t7)
	move $t0 $t9
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
	move $s3 $v0
	move $s0 $s3
	move $t5 $t6
	move $t1 $s0
	move $a0 $t5
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
	move $t7 $v0
	move $t9 $t7
	move $s7 $t9
	li $t0 0
	sub $v0, $t0, 555
	move $s3 $v0
	move $t6 $s3
	move $a0 $t6
	jal _print
L35:
	nop
	b L37
L36:
	nop
	li $s0 0
	move $t2 $s0
L37:
	nop
	li $t5 1
	sub $v0, $t5, $s5
	move $t1 $v0
	move $t7 $t1
	beqz $t7 L38
	move $t9 $t8
	move $t4 $t9
	move $s7 $t8
	move $t0 $s7
	lw $s3 0($t0)
	move $t6 $s3
	lw $s0 0($t6)
	move $t2 $s7
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
	move $t5 $v0
	move $t1 $t5
	move $t8 $t1
	move $t7 $t8
	move $t9 $t7
	lw $t0 0($t9)
	move $s3 $t0
	lw $t6 36($s3)
	move $s7 $t7
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
	move $t2 $s0
	move $s2 $t2
	move $t5 $t8
	move $t1 $t5
	lw $t9 0($t1)
	move $t0 $t9
	lw $s3 20($t0)
	move $t7 $t5
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
	move $t6 $v0
	move $s7 $t6
	move $s6 $s7
	li $s0 1
	move $s1 $s0
	b L39
L38:
	nop
	li $t2 0
	move $t2 $t2
L39:
	nop
	b L32
L40:
	nop
	move $t1 $t3
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
	lw $fp, 500($sp)
	addu $sp, $sp, 508
	j $ra

	.text
	.globl List_Search
List_Search:
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
	move $t0 $a1
	li $t5 0
	move $s3 $t5
	move $t7 $t9
	move $t6 $t7
	move $s7 $t9
	lw $s0 12($s7)
	move $t2 $s0
	move $s4 $t2
	move $s5 $t9
	lw $s1 4($s5)
	move $t8 $s1
	move $t4 $t8
L41:
	li $s2 1
	sub $v0, $s2, $s4
	move $s6 $v0
	move $t3 $s6
	beqz $t3 L44
	move $t1 $t0
	move $t5 $t1
	lw $t7 0($t5)
	move $s7 $t7
	lw $s0 8($s7)
	move $t2 $t4
	move $t9 $t1
	move $s5 $t2
	move $a0 $t9
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
	move $s1 $v0
	move $t8 $s1
	beqz $t8 L42
	li $s2 1
	move $s3 $s2
	b L43
L42:
	nop
	li $s6 0
	move $t3 $s6
L43:
	nop
	move $t5 $t6
	move $t7 $t5
	lw $s7 0($t7)
	move $t1 $s7
	lw $t2 0($t1)
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
	move $t9 $v0
	move $s5 $t9
	move $t6 $s5
	move $s1 $t6
	move $t8 $s1
	lw $s2 0($t8)
	move $s6 $s2
	lw $t3 36($s6)
	move $t7 $s1
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
	move $t1 $s7
	move $s4 $t1
	move $t5 $t6
	move $t2 $t5
	lw $s0 0($t2)
	move $t9 $s0
	lw $s5 20($t9)
	move $t8 $t5
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
	move $s2 $v0
	move $s6 $s2
	move $t4 $s6
	b L41
L44:
	nop
	move $s1 $s3
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
	.globl List_GetEnd
List_GetEnd:
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
	move $t3 $t7
	lw $s7 12($t3)
	move $t1 $s7
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
	.globl List_GetElem
List_GetElem:
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
	move $s0 $t2
	lw $t9 4($s0)
	move $t5 $t9
	move $v0 $t5
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
	.globl List_GetNext
List_GetNext:
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
	move $s5 $t8
	lw $s2 8($s5)
	move $s6 $s2
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
	.globl List_Print
List_Print:
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
	move $t6 $a0
	move $t0 $t6
	move $s4 $t0
	move $t4 $t6
	lw $s3 12($t4)
	move $s1 $s3
	move $t7 $s1
	move $t3 $t6
	lw $s7 4($t3)
	move $t1 $s7
	move $t2 $t1
L45:
	li $s0 1
	sub $v0, $s0, $t7
	move $t9 $v0
	move $t5 $t9
	beqz $t5 L46
	move $t8 $t2
	move $s5 $t8
	lw $s2 0($s5)
	move $s6 $s2
	lw $t0 0($s6)
	move $t4 $t8
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
	move $s3 $v0
	move $s1 $s3
	move $a0 $s1
	jal _print
	move $t6 $s4
	move $t3 $t6
	lw $s7 0($t3)
	move $t1 $s7
	lw $s0 0($t1)
	move $t9 $t6
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
	move $t5 $v0
	move $s5 $t5
	move $s4 $s5
	move $s2 $s4
	move $s6 $s2
	lw $t8 0($s6)
	move $t0 $t8
	lw $t4 36($t0)
	move $s3 $s2
	move $a0 $s3
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
	move $s1 $v0
	move $t3 $s1
	move $t7 $t3
	move $s7 $s4
	move $t1 $s7
	lw $t6 0($t1)
	move $s0 $t6
	lw $t9 20($s0)
	move $t5 $s7
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
	move $s5 $v0
	move $s6 $s5
	move $t2 $s6
	b L45
L46:
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
	lw $fp, 496($sp)
	addu $sp, $sp, 504
	j $ra

	.text
	.globl Create_LL
Create_LL:
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
	move $s2 $t0
	move $t4 $s2
	la $s3 LL_Start
	sw $s3, 0($t4)
	li $a0 4
	jal _halloc
	move $v0 $v0
	move $s1 $v0
	move $t3 $s1
	move $t1 $t3
	move $t6 $s2
	sw $t6, 0($t1)
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
	.globl LL_Start
LL_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 516
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
	jalr Create_List
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
	move $t9 $s7
	move $t5 $t9
	move $s5 $t5
	lw $s6 0($s5)
	move $s4 $s6
	lw $t7 16($s4)
	move $t2 $t5
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
	move $t0 $t8
	move $t4 $t0
	move $s3 $t9
	move $s1 $s3
	move $s2 $s1
	move $t1 $s2
	lw $t6 0($t1)
	move $t3 $t6
	lw $s0 16($t3)
	move $s7 $s2
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
	move $s6 $s5
	move $t4 $s6
	move $s4 $s1
	move $t5 $s4
	lw $t7 0($t5)
	move $t2 $t7
	lw $t8 32($t2)
	move $t0 $s4
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
	move $t4 $v0
	move $t9 $t4
	move $t4 $t9
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
	jalr Create_Element
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
	move $t6 $t1
	move $t3 $t6
	move $s2 $t3
	lw $s0 0($s2)
	move $s7 $s0
	lw $s5 4($s7)
	li $s6 25
	li $t5 37000
	li $t7 0
	move $t2 $t3
	move $s4 $s6
	move $t8 $t5
	move $t0 $t7
	move $a0 $t2
	move $a1 $s4
	move $a2 $t8
	move $a3 $t0
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
	move $t4 $v0
	move $t9 $t4
	move $t4 $t9
	move $s3 $s1
	move $t1 $s3
	lw $s2 0($t1)
	move $s0 $s2
	lw $s7 8($s0)
	move $t3 $t6
	move $s6 $s3
	move $t5 $t3
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
	move $t7 $v0
	move $s5 $t7
	move $s1 $s5
	move $t2 $s1
	move $s4 $t2
	lw $t8 0($s4)
	move $t0 $t8
	lw $t4 32($t0)
	move $t9 $t2
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
	move $t1 $v0
	move $s2 $t1
	move $t4 $s2
	li $s0 10000000
	move $a0 $s0
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
	jalr Create_Element
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
	move $t3 $s3
	move $t6 $t3
	move $s7 $t6
	move $s6 $s7
	lw $t5 0($s6)
	move $t7 $t5
	lw $s5 4($t7)
	li $s4 39
	li $t8 42000
	li $t0 1
	move $t2 $s7
	move $t4 $s4
	move $t9 $t8
	move $t1 $t0
	move $a0 $t2
	move $a1 $t4
	move $a2 $t9
	move $a3 $t1
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
	move $s0 $s2
	move $t4 $s0
	move $s3 $t6
	move $t3 $s3
	move $s6 $s1
	move $t5 $s6
	lw $t7 0($t5)
	move $s7 $t7
	lw $s4 8($s7)
	move $t8 $t6
	move $t0 $s6
	move $s5 $t8
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
	move $t2 $v0
	move $t4 $t2
	move $s1 $t4
	move $t9 $s1
	move $t1 $t9
	lw $s2 0($t1)
	move $s0 $s2
	lw $s3 32($s0)
	move $t5 $t9
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
	move $t7 $v0
	move $s7 $t7
	move $t4 $s7
	li $s6 10000000
	move $a0 $s6
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
	jalr Create_Element
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
	move $s4 $t8
	move $t6 $s4
	move $t0 $t6
	move $s5 $t0
	lw $t2 0($s5)
	move $t4 $t2
	lw $t1 4($t4)
	li $s2 22
	li $s0 34000
	li $t9 0
	move $s3 $t0
	move $t5 $s2
	move $t7 $s0
	move $s7 $t9
	move $a0 $s3
	move $a1 $t5
	move $a2 $t7
	move $a3 $s7
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
	move $s6 $v0
	move $t8 $s6
	move $t4 $t8
	move $s4 $s1
	move $s5 $s4
	lw $t2 0($s5)
	move $t4 $t2
	lw $t0 8($t4)
	move $s2 $t6
	move $s0 $s4
	move $t9 $s2
	move $a0 $s0
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
	move $t1 $v0
	move $s3 $t1
	move $s1 $s3
	move $t5 $s1
	move $t7 $t5
	lw $s7 0($t7)
	move $s6 $s7
	lw $t8 32($s6)
	move $s5 $t5
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
	move $t2 $v0
	move $t4 $t2
	move $t4 $t4
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
	jalr Create_Element
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
	move $s2 $s4
	move $t0 $s2
	move $s0 $t0
	move $t9 $s0
	lw $t1 0($t9)
	move $s3 $t1
	lw $t7 4($s3)
	li $s7 27
	li $s6 34000
	li $t5 0
	move $t8 $s0
	move $s5 $s7
	move $t2 $s6
	move $t4 $t5
	move $a0 $t8
	move $a1 $s5
	move $a2 $t2
	move $a3 $t4
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
	move $s4 $v0
	move $s2 $s4
	move $t4 $s2
	move $t9 $s1
	move $t1 $t9
	lw $s3 0($t1)
	move $s0 $s3
	lw $s7 4($s0)
	move $s6 $t3
	move $t5 $t9
	move $t7 $s6
	move $a0 $t5
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
	move $s5 $t8
	move $a0 $s5
	jal _print
	move $t2 $s1
	move $t4 $t2
	lw $s4 0($t4)
	move $s2 $s4
	lw $t1 4($s2)
	move $s3 $t0
	move $s0 $t2
	move $t9 $s3
	move $a0 $s0
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
	move $s6 $v0
	move $s7 $s6
	move $a0 $s7
	jal _print
	li $t5 10000000
	move $a0 $t5
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
	jalr Create_Element
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
	move $t6 $t8
	move $s5 $t6
	move $t4 $s5
	lw $s4 0($t4)
	move $s2 $s4
	lw $t0 4($s2)
	li $t2 28
	li $s3 35000
	li $t1 0
	move $s0 $s5
	move $t9 $t2
	move $s6 $s3
	move $s7 $t1
	move $a0 $s0
	move $a1 $t9
	move $a2 $s6
	move $a3 $s7
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
	move $t5 $v0
	move $t7 $t5
	move $t4 $t7
	move $t8 $s1
	move $t4 $t8
	lw $s4 0($t4)
	move $s2 $s4
	lw $s5 8($s2)
	move $t2 $t6
	move $s3 $t8
	move $t1 $t2
	move $a0 $s3
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
	move $t0 $v0
	move $s0 $t0
	move $s1 $s0
	move $t9 $s1
	move $s6 $t9
	lw $s7 0($s6)
	move $t5 $s7
	lw $t7 32($t5)
	move $t4 $t9
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
	move $s4 $v0
	move $s2 $s4
	move $t4 $s2
	li $t8 2220000
	move $a0 $t8
	jal _print
	move $t2 $s1
	move $s5 $t2
	lw $s3 0($s5)
	move $t1 $s3
	lw $t0 24($t1)
	move $s0 $t3
	move $s6 $t2
	move $s7 $s0
	move $a0 $s6
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
	move $t5 $v0
	move $t9 $t5
	move $s1 $t9
	move $t7 $s1
	move $t4 $t7
	lw $s4 0($t4)
	move $s2 $s4
	lw $t8 32($s2)
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
	move $t1 $s3
	move $t4 $t1
	li $t3 33300000
	move $a0 $t3
	jal _print
	move $t2 $s1
	move $s0 $t2
	lw $t0 0($s0)
	move $s6 $t0
	lw $s7 24($s6)
	move $t5 $t6
	move $t9 $t2
	move $t4 $t5
	move $a0 $t9
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
	move $s2 $s4
	move $s1 $s2
	move $t7 $s1
	move $t8 $t7
	lw $s5 0($t8)
	move $s3 $s5
	lw $t1 32($s3)
	move $t3 $t7
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
	move $s0 $v0
	move $t0 $s0
	move $t4 $t0
	li $s6 44440000
	move $a0 $s6
	jal _print
	li $t6 0
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
	lw $fp, 508($sp)
	addu $sp, $sp, 516
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
