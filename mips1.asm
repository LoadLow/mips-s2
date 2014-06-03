	.data
str:	.asciiz "Somme = "
	
	.text 
loop:
	li $v0, 5
	syscall 
	beqz $v0, end
	add $s0, $s0, $v0	
	j loop
end:
	li $v0, 4
	la $a0, str
	syscall 
	li $v0, 1
	la $a0, ($s0)
	syscall
	li $v0, 10
	syscall 
	