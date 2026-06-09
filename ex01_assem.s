# 1. Receba os valores do comprimento, largura e altura de um paralelepipedo. Calcule e mostre
# seu volume.

.data
	msg1: .asciiz "\n Digite um valor para comprimento: "
	msg2: .asciiz "\n Digite um valor para largura: "
	msg3: .asciiz "\n Digite um valor para altura: "
	msg4: .asciiz "\n O volume do paralelepipedo equivale a: "
.text

main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	mul $t3, $t0, $t1
	mul $t4, $t3, $t2
	
	li $v0, 4
	la $a0, msg4
	syscall
	li $v0, 1
	add $a0, $t4, 0
	syscall
