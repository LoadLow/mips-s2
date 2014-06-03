	.data
save:	.word 0, 0, 0, 0, 0, 0, 0, 1, 2, 3

	.text
main:
	li $a2, 9
	li $a1, 1
	la $a0, save
	
	jal rechercher	#rechercher(save, 1, 9)
	
	move $a0, $v0	#print_int($v0)
	li $v0, 1
	syscall
	
	li $v0, 10	#exit()
	syscall
	
rechercher:
	li $v0, 0
loop:	#for(int $v0 = 0; $v0 <= $a2; ++$v0)
	bgt $v0, $a2, end	#if($v0 > $a2) break;
	mul $t1, $v0, 4
	add $t1, $a0, $t1
	lw $t2, ($t1)		#$t2 = $a0[$a2]
	
	beq $t2, $a1, end	#if($a0[$v0] == $a1) break;
	addi $v0, $v0, 1	#++$v0
	j loop
end:
	jr $ra			#return $v0