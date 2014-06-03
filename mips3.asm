	.data
str1:	.asciiz "Entier : "
str2: 	.asciiz "Puissance : "
str3:	.asciiz "Resultat : "


	
	.text
main:
	li $v0, 4
	la $a0, str1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, str2
	syscall
	
	li $v0, 5
	syscall
	
	move $a0, $s0
	move $a1, $v0
	
	jal power
	
	move $s1, $v0
	
	li $v0, 4
	la $a0, str3
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 10
	syscall
	
power:
	addi $sp, $sp, -12
	sw $a0, ($sp)
	sw $a1, 4($sp)
	sw $ra, 8($sp)
	
	beq $a1, 0, end_power	#goto end_power
	
	addi $a1, $a1, -1	#--n
	jal power
	
	lw $a0, ($sp)
	lw $a1, 4($sp)
	lw $ra, 8($sp)
	
	addi $sp, $sp, 12
	
	mul $v0, $v0, $a0	#return power(n) * i
	jr $ra
end_power:
	lw $a0, ($sp)
	lw $a1, 4($sp)
	lw $ra, 8($sp)
	
	addi $sp, $sp, 12
	li $v0, 1		#return 1
	jr $ra