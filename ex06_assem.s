# 6. Receba 10 numeros inteiros reais. Verifique e mostre o maior e o menor valor.
# Obs.: somente valores positivos. Se o numero for negativo, deve ser desconsiderado e solicitado
# novamente.

.data
	msg1: .asciiz "\n Digite um numero: "
	msg2: .asciiz "\n O numero e invalido, digite outro: "
	msg3: .asciiz "\n O maior valor equivale a: "
	msg4: .asciiz "\n O menor valor equivale a: "
.text

main:
	li $t0, 10
	li $t1, 0
	li $t2, 2147483647
loop:
	beqz $t0, fimse

	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t9, $v0, 0
	
	bltz $t9, erro
etapa1:
	bgt $t9, $t1, maior
etapa2:
	blt $t9, $t2, menor
	
decrem:
	sub $t0, $t0, 1
	j loop
	

maior:
	add $t1, $t9, 0
	j etapa2

menor:
	add $t2, $t9, 0
	j decrem

erro:
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	add $t9, $v0, 0
	
	bltz $t9, erro
	j etapa1

fimse:
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 1
	add $a0, $t1, 0
	syscall
	
	li $v0, 4
	la $a0, msg4
	syscall
	li $v0, 1
	add $a0, $t2, 0
	syscall