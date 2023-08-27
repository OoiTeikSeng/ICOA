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
    li $v0, 4          # syscall code for printing string
    la $a0, outputMsg # load address of the output message
    syscall

    # Input A value
    li $v0, 4          # syscall code for printing string
    la $a0, inputAMsg  # load address of the input message
    syscall
    li $v0, 5          # syscall code for reading integer
    syscall
    sw $v0, aValue     # store the input value in aValue

    # Input B value
    li $v0, 4          # syscall code for printing string
    la $a0, inputBMsg  # load address of the input message
    syscall
    li $v0, 5          # syscall code for reading integer
    syscall
    sw $v0, bValue     # store the input value in bValue

    # Input C value
    li $v0, 4          # syscall code for printing string
    la $a0, inputCMsg  # load address of the input message
    syscall
    li $v0, 5          # syscall code for reading integer
    syscall
    sw $v0, cValue     # store the input value in cValue

    # Calculate the result
    lw $t0, aValue     # load aValue into $t0
    lw $t1, bValue     # load bValue into $t1
    add $t2, $t0, $t1  # $t2 = $t0 + $t1
    lw $t3, cValue     # load cValue into $t3
    cvt.d.w $f0, $t2   # convert $t2 to double and store in $f0
    cvt.d.w $f1, $t3   # convert $t3 to double and store in $f1
    div.d $f2, $f0, $f1 # $f2 = $f0 / $f1
    s.d $f2, result    # store the result in result

    # Print the result message
    li $v0, 4              # syscall code for printing string
    la $a0, outputTotalMsg # load address of the output message
    syscall
    l.d $f12, result       # load the result from memory to $f12
    
    # Print the double result
    li $v0, 3              # syscall code for printing double
    syscall

    # Exit the program
    li $v0, 10             # syscall code for exit
    syscall


