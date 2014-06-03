	.data
values:	.word 0, 0, 0
label:	.asciiz "Somme : "

	.text
	li $s0, 3

loop1:	
	li $v0, 5 		#read_int
	syscall 
	
	sw $v0, values + 64	#values[2] = $v0
	
	li $s1, 2
loop2:	#for(int i = 2; i != 0 && values[i] >= values[i - 1]; --i)
	beq $s1, 0, end2	#if(i == 0) break;
	mul $s2, $s1, 32	#$s2 = i * 32
	
	lw $t0, values($s2)	#$t0 = values[i]
	addi $t2, $s2, -32
	lw $t1, values($t2)	#$t1 = values[i - 1]
	
	blt $t0, $t1, end2	#if(values[i] < values[i - 1]) break;
	
	#swap values[i], values[i - 1]
	sw $t0, values($t2)	#values[i - 1] = values[i]
	sw $t1, values($s2)	#values[i] = values[i - 1]
	
	addi $s1, $s1, -1	#--i
	
	j loop2
end2:
	addi $s0, $s0, -1
	beqz $s0, end		#if($s0 == 0) break;
	j loop1
end:

	li $v0, 4
	la $a0, label
	syscall

	lw $t0, values
	lw $t1, values + 32
	add $a0, $t0, $t1	#$a0 = values[0] + values[1]
	li $v0, 1
	syscall