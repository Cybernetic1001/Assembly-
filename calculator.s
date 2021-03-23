.data

first_int: .asciiz " Enter first integer: "
second_int: .asciiz "Enter second integer: "
menu: .asciiz "Enter type of operation:"
operation: .asciiz " 0 to add, 1 to sub, and 2 to multiply "
choice: .asciiz "   Enter your choice "
i_err: .asciiz "Invalid input ..Try again :"
result: .asciiz "The result is : "

.text
.globl main
main:

INITIAL:
li $v0,4
la $a0,first_int
syscall

li $v0,5            #reading the first input
syscall
move $t1,$v0

li $v0,4
la $a0,second_int
syscall

li $v0,5            #reading second input
syscall
move $t2,$v0

li $v0,4
la $a0,menu
syscall

li $v0,4
la $a0,operation
syscall

li $v0,4
la $a0,choice
syscall

li $v0,5            #reading the choice of operation
syscall
move $t0,$v0

li $t3,1
beq $t0,$0,ADD_NUM
beq $t0,$t3,SUB_NUM
li $t3,2
beq $t0,$t3,MUL_NUM

error_msg:
li $v0,4
la $a0,i_err
syscall

j INITIAL   #jump to beginning label,, repeat if error 

ADD_NUM:
add $t3,$t1,$t2

li $v0,4            #printing the result
la $a0,result
syscall

li $v0,1            #printing the answer value
add $a0,$t3,$0
syscall

j exit

SUB_NUM:
sub $t3,$t1,$t2

li $v0,4            #printing the result
la $a0,result
syscall

li $v0,1            #printing the answer value
add $a0,$t3,$0
syscall

j exit

MUL_NUM:
mult $t1,$t2

li $v0,4            #printing the result
la $a0,result
syscall

li $v0,1            #printing the answer value
mfhi $a0
syscall

li $v0,1
mflo $a0
syscall

exit:

li $v0,10
syscall

# C) 6 registers are used to implement the program: $v0, $a0, $t0 - $t3 
# D) total systems calls needed is 4: printing string, reading the number, printing integer, and closing the program 
