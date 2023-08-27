.data
aValue:         .word 0
bValue:         .word 0
cValue:         .word 0
result:         .double 0.0
outputMsg:      .asciiz "The equation for this selection is (A + B) * C\n\n"
inputAMsg:      .asciiz "Enter a value for A: "
inputBMsg:      .asciiz "Enter a value for B: "
inputCMsg:      .asciiz "Enter a value for C: "
outputTotalMsg: .asciiz "The total of the values are "

.text
.globl main

main:
    # Print the introduction message
    li $v0, 4          
    la $a0, outputMsg 
    syscall

    # Input A value
    li $v0, 4          
    la $a0, inputAMsg  
    syscall
    li $v0, 5          
    syscall
    sw $v0, aValue     

    # Input B value
    li $v0, 4          
    la $a0, inputBMsg  
    syscall
    li $v0, 5          
    syscall
    sw $v0, bValue     

    # Input C value
    li $v0, 4          
    la $a0, inputCMsg  
    syscall
    li $v0, 5          
    syscall
    sw $v0, cValue     

    # Calculate the result
    lw $t0, aValue     
    lw $t1, bValue     
    add $t2, $t0, $t1  
    lw $t3, cValue     
    cvt.d.w $f0, $t2   
    cvt.d.w $f1, $t3   
    div.d $f2, $f0, $f1 
    s.d $f2, result    

    # Print the result message
    li $v0, 4              
    la $a0, outputTotalMsg 
    syscall
    l.d $f12, result       
    
    # Print the double result
    li $v0, 3              
    syscall

    # Exit the program
    li $v0, 10             
    syscall


