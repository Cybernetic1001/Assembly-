.data 

x: .word 0 
y: .word 0 

variablemsg: .asciiz "y = " 
newline: .asciiz "\n" 

.text 

.globl main 

main: 
	# load data into registers 
	lw $s0, x
	lw $s1, y
	
	addi $s0, $s0, 5 

	add $a0, $s0, $zero
	jal equation 
	
	add $s1,$s1, $v0 
	#print value of the register $s1

	li $v0, 4
	la $a0,variablemsg 
	syscall 

	li $v0, 1
	add $a0,$s1, $zero  
	syscall
	
	li $v0, 4
	la $a0, newline  
	syscall

	li $v0, 10 
	syscall

equation: 
	#3*a+5 
	li $t0,3
	mul $t0,$t0,$a0 
	addi $t0, $t0, 5 

	# Move the result to the return register 
	# print value of the register $s1
	add $v0, $t0, $zero 
	jr $ra
 