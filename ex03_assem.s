# 3. Receba 2 valores inteiros. Calcule e mostre o resultado da diferença do maior pelo menor
# valor.

.data
	msg1: .asciiz "\n Digite um primeiro valor: "
	msg2: .asciiz "\n Digite um segundo valor: "
	msg3: .asciiz "\n O primeiro valor e invalido, digite outro: "
	msg4: .asciiz "\n O segundo valor e invalido, digite outro: "
	msg5: .asciiz "\n A subtracao do primeiro pelo segundo equivale a: "
	msg6: .asciiz "\n A subtracao do segundo pelo primeiro equivale a: "
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
	
comp:
	bltz $t1, erro2
	
	bgt $t0, $t1, maior1
	j maior2
	
maior1:
	sub $t3 $t0, $t1
	
	li $v0, 4
	la $a0, msg5
	syscall
	li $v0, 1
	add $a0, $t3, 0
	syscall
	j fimse
	
maior2:
	sub $t3 $t1, $t0
	
	li $v0, 4
	la $a0, msg6
	syscall
	li $v0, 1
	add $a0, $t3, 0
	syscall
	j fimse
	
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
	
	bltz $t0, erro2
	j comp
	
fimse:	