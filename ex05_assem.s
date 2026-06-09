# 5. Receba 2 numeros inteiros, verifique qual o maior entre eles. Calcule e mostre o resultado da
# somatoria dos numeros impares entre esses valores

.data
	msg1: .asciiz "\n Digite um primeiro numero: "
	msg2: .asciiz "\n Digite um segundo numero: "
	msg3: .asciiz "\n O primeiro numero e invalido, digite outro: "
	msg4: .asciiz "\n O segundo numero e invalido, digite outro: "
	msg5: .asciiz "\n A somatoria dos impares equivale a: "
.text

p1:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	bltz $t0, erro1
	
p2:
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	bltz $t1, erro2
	
comp:
	bge $t0, $t1, maior1
	j maior2	
maior1:
	li $t4, 0
	add $t5, $t1, 1
	add $t7, $t0, 0
	j menu
	
maior2:
	li $t4, 0
	add $t5, $t0, 1
	add $t7, $t1, 0
	j menu
	
menu:
	bge $t5, $t7, fimse

	rem $t6, $t5, 2
	
	beqz $t6, par
	j impar
	
par:
	add $t5, $t5, 1
	j menu
impar:
	add $t4, $t4, $t5
	add $t5, $t5, 1
	j menu
	
erro1:
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	bltz $t0, erro1
	j p2
	
erro2:
	li $v0, 4
	la $a0, msg4
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	bltz $t1, erro2
	j comp
	
fimse:
	li $v0, 4
	la $a0, msg5
	syscall
	li $v0, 1
	add $a0, $t4, 0
	syscall