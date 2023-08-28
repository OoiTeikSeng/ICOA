.data
aLogicValue : .word 0
bLogicValue : .word 0
cLogicValue : .word 0
resultLogic : .word 0
newLine : .asciiz "\n"
warningLogic : .asciiz "Only enter in integers!! "
logicPromptA : .asciiz "Enter a value for A: "
logicPromptB : .asciiz "Enter a value for B: "
logicPromptC : .asciiz "Enter a value for C: "
resultLogicMsg : .asciiz "The result of (A AND B) OR C is "
logicalOperation	: .asciiz "You have chose then operation of (A OR B) AND C"

.text
.globl main

main:
	# Print type of operation 
	li $v0, 4
	la $a0, logicalOperation
	syscall

	# Go to next line
	li   $v0, 4
	la   $a0, newLine
	syscall

    # Print warning message 
    li $v0, 4
    la $a0, warningLogic
    syscall

    # Go to next line
    li   $v0, 4
    la   $a0, newLine
    syscall

    # Print prompt for A
    li   $v0, 4
    la   $a0, logicPromptA
    syscall

    # Read value A
    li   $v0, 5
    syscall
    sw   $v0, aLogicValue

    # Print prompt for B
    li   $v0, 4
    la   $a0, logicPromptB
    syscall

    # Read value B
    li   $v0, 5
    syscall
    sw   $v0, bLogicValue

    # Print prompt for C
    li   $v0, 4
    la   $a0, logicPromptC
    syscall

    # Read value C
    li   $v0, 5
    syscall
    sw   $v0, cLogicValue

    # Load values for the logical operation
    lw   $t0, aLogicValue
    lw   $t1, bLogicValue
    lw   $t2, cLogicValue

    # Perform (A AND B)
    and  $t3, $t0, $t1

    # Perform (A AND B) OR C
    or   $t4, $t3, $t2
    sw   $t4, resultLogic

    # Print result message
    li   $v0, 4
    la   $a0, resultLogicMsg
    syscall

    # Print result value
    lw   $a0, resultLogic
    li   $v0, 1
    syscall

    # Go to next line
    li   $v0, 4
    la   $a0, newLine
    syscall

    # Exit
    li   $v0, 10
    syscall

