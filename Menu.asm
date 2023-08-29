.data
prompt:     .asciiz "Choose an option:\n 1. Blank\n 2. (A AND B) OR C\n 3. (A OR B) AND C\n 4. Blank\n 5. (A * B) / C\n 6. Blank\n 7. Exit\n"
selection	: .asciiz "Choose an operation: "
aArithValue : .float 0.0
bArithValue : .float 0.0
cArithValue : .float 0.0
resultArith : .float 0.0
aLogicValue : .word 0
bLogicValue : .word 0
cLogicValue : .word 0
resultLogic : .word 0
newLine		: .asciiz "\n"
warning : .asciiz "Only enter in integers!! "
valueOfA : .asciiz "Enter a value for A: "
valueOfB : .asciiz "Enter a value for B: "
valueOfC : .asciiz "Enter a value for C: "
resultTotal : .asciiz "The total of the values are (A + B) / C = "
arithmeticOperation	: .asciiz "You have chose then operation of (A + B) / C "
resultLogicMsg : .asciiz "The result of (A AND B) OR C is "
logicalOperation	: .asciiz "You have chose then operation of (A AND B) OR C"

.text
.globl main

main:
    li $t0, 0   # Loop control variable

menu_loop:
    # Display menu
    la $a0, prompt
    li $v0, 4
    syscall
    
	# Print prompt for operation selection
	li   $v0, 4        
	la   $a0, selection 
	syscall

    # Read user choice
    li $v0, 5
    syscall
    move $t1, $v0   # Store user choice in $t1

    # Perform operations based on user choice
    beq $t1, 1, option_1
    beq $t1, 2, option_2
    beq $t1, 3, option_3
    beq $t1, 4, option_4
    beq $t1, 5, option_5
	beq $t1, 6, option_6
    beq $t1, 7, exit
    
    j menu_loop     # Invalid choice, repeat menu loop

option_1:

j menu_loop

option_2:
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
    la $a0, warning
    syscall

    # Go to next line
    li   $v0, 4
    la   $a0, newLine
    syscall

    # Print prompt for A
    li   $v0, 4
    la   $a0, valueOfA
    syscall

    # Read value A
    li   $v0, 5
    syscall
    sw   $v0, aLogicValue

    # Print prompt for B
    li   $v0, 4
    la   $a0, valueOfB
    syscall

    # Read value B
    li   $v0, 5
    syscall
    sw   $v0, bLogicValue

    # Print prompt for C
    li   $v0, 4
    la   $a0, valueOfC
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

    # Go to next line
    li   $v0, 4
    la   $a0, newLine
    syscall

    j menu_loop

option_3:

    j menu_loop

option_4:

    j menu_loop

option_5:
    # Print type of operation 
	li $v0, 4
	la $a0, arithmeticOperation
	syscall

	# Go to next line
	li   $v0, 4
	la   $a0, newLine
	syscall	
	
	# Print warning message 
	li $v0, 4
	la $a0, warning
	syscall

	# Go to next line
	li   $v0, 4
	la   $a0, newLine
	syscall

	# Print prompt for A
	li   $v0, 4        
	la   $a0, valueOfA 
	syscall

	# Read value A
	li   $v0, 6        
	syscall
	swc1 $f0, aArithValue   

	# Print prompt for B
	li   $v0, 4        
	la   $a0, valueOfB 
	syscall

	# Read value B
	li   $v0, 6        
	syscall
	swc1 $f0, bArithValue   

	# Print prompt for C
	li   $v0, 4        
	la   $a0, valueOfC 
	syscall

	# Read value C
	li   $v0, 6       
	syscall
	swc1 $f0, cArithValue   

	# Calculate result : (aArithValue + bArithValue) / cArithValue
	lwc1 $f4, aArithValue   
	lwc1 $f6, bArithValue   
	lwc1 $f8, cArithValue   
	add.s $f10, $f4, $f6   
	div.s $f10, $f10, $f8  
	swc1 $f10, resultArith   

	# Print result message
	li   $v0, 4            
	la   $a0, resultTotal   
	syscall

	# Print result value
	lwc1 $f12, resultArith     
	li   $v0, 2            
	syscall

	# Go to next line
	li   $v0, 4            
	la   $a0, newLine     
	syscall

	# Go to next line
	li   $v0, 4            
	la   $a0, newLine     
	syscall
    
    j menu_loop

option_6:
    j menu_loop

exit:
    # Exit the program
    li $v0, 10
    syscall
