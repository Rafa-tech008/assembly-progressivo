# 4. Receba 4 notas bimestrais de um aluno. Calcule e mostre a media aritmetica. Mostre a
# mensagem de acordo com a media:
# a. Se a media for >= 6,0 exibir “APROVADO”;
# b. Se a media for >= 3,0 ou < 6,0 exibir “EXAME”;
# c. Se a media for < 3,0 exibir “RETIDO”.

.data
	msg1: .asciiz "\n Digite a nota 1: "
	msg2: .asciiz "\n Digite a nota 2: "
	msg3: .asciiz "\n Digite a nota 3: "
	msg4: .asciiz "\n Digite a nota 4: "
	msg5: .asciiz "\n A media aritmetica equivale a: "
	msg6: .asciiz "\n APROVADO"
	msg7: .asciiz "\n EXAME"
	msg8: .asciiz "\n RETIDO"
.text

main:
	li $t8, 4
	
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
	
	li $v0, 4
	la $a0, msg4
	syscall
	li $v0, 5
	syscall
	add $t3, $v0, 0
	
	add $t4, $t0, $t1
	add $t5, $t2, $t3
	add $t6, $t4, $t5
	div $t7, $t6, $t8
	
	bge $t7, 6, aprov
	j teste
	
aprov:
	li $v0, 4
	la $a0, msg5
	syscall
	li $v0, 1
	add $a0, $t7, 0
	syscall
	
	li $v0, 4
	la $a0, msg6
	syscall
	j fimse
	
teste:
	blt $t7, 3, retido
	
	li $v0, 4
	la $a0, msg5
	syscall
	li $v0, 1
	add $a0, $t7, 0
	syscall
	
	li $v0, 4
	la $a0, msg7
	syscall
	j fimse
	
retido:
	li $v0, 4
	la $a0, msg5
	syscall
	li $v0, 1
	add $a0, $t7, 0
	syscall
	
	li $v0, 4
	la $a0, msg8
	syscall
	j fimse
	
fimse: