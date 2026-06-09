# 2. Receba o raio de uma circunferencia. Calcule e mostre o comprimento da circunferencia.
# Considere PI = 3.

.data
	msg1: .asciiz "\n Digite um valor para o raio: "
	msg2: .asciiz "\n O valor do comprimento é: "
.text

main:
	li $t0, 2 # 2 da fórmula
	li $t1, 3 # Valor de PI
	
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	mul $t3, $t0, $t2
	mul $t4, $t3, $t1
	
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 1
	add $a0, $t4, 0
	syscall