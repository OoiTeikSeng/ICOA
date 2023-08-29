.data
prompt:     .asciiz "Choose an option:\n 1. Blank\n 2. (A AND B) OR C\n 3. (A OR B) AND C\n 4. Blank\n 5. (A + B) / C\n 6. (A + B) * C\n 7. Exit\n"
selection	: .asciiz "Choose an operation: "
aArithValue : .float 0.0
bArithValue : .float 0.0
cArithValue : .float 0.0
resultArith : .float 0.0
aLogicValue : .word 0
bLogicValue : .word 0
cLogicValue : .word 0
resultLogic : .word 0
exitMsg     : .asciiz "You have successfully exit.\n"
newLine		: .asciiz "\n"
warning : .asciiz "Only enter in integers!! "
valueOfA : .asciiz "Enter a value for A: "
valueOfB : .asciiz "Enter a value for B: "
valueOfC : .asciiz "Enter a value for C: "
resultTotal2 : .asciiz "The result of (A + B) / C = "
resultTotal3 : .asciiz "The result of (A + B) * C = "
arithmeticOperation2	: .asciiz "You have chose the operation of (A + B) / C "
arithmeticOperation3	: .asciiz "You have chose the operation of (A + B) * C "
resultLogicMsg2 : .asciiz "The result of (A AND B) OR C is "
resultLogicMsg3 : .asciiz "The result of (A OR B) AND C is "
logicalOperation2	: .asciiz "You have chose the operation of (A AND B) OR C"
logicalOperation3	: .asciiz "You have chose the operation of (A OR B) AND C"

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
	la $a0, logicalOperation2
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
    la   $a0, resultLogicMsg2
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
    # Print type of operation 
	li $v0, 4
	la $a0, logicalOperation3
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

    # Display prompt for the first integer
    li $v0, 4
    la $a0, valueOfA
    syscall
    
    # Read the first integer from the user
    li $v0, 5
    syscall
    move $t0, $v0
    
    # Display prompt for the second integer
    li $v0, 4
    la $a0, valueOfB
    syscall
    
    # Read the second integer from the user
    li $v0, 5
    syscall
    move $t1, $v0

    # Display prompt for the third integer
    li $v0, 4
    la $a0, valueOfC
    syscall
    
    # Read the third integer from the user
    li $v0, 5
    syscall
    move $t2, $v0
    
    # Perform OR operation and AND operation
    or $t3, $t0, $t1    # $t2 = $t0 or $t1
    and $t3, $t2, $t3   # $t4 = $t2 AND $t3
    
    # Display the result label
    li $v0, 4
    la $a0, resultLogicMsg3
    syscall

    move $a0, $t3
    li $v0, 1
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

option_4:

    j menu_loop

option_5:
    # Print type of operation 
	li $v0, 4
	la $a0, arithmeticOperation2
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
	la   $a0, resultTotal2   
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
    # Print type of operation 
	li $v0, 4
	la $a0, arithmeticOperation3
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

    # Print prompts and get user inputs
    li $v0, 4                  # Print string 
    la $a0, valueOfA           # Load string address
    syscall                    # Print it

    li $v0, 5                  # Read integer
    syscall                    # Read it
    move $t0, $v0              # Store a in $t0

    li $v0, 4                  # Print string 
    la $a0, valueOfB           # Load string address 
    syscall

    li $v0, 5                  # Read integer syscall code
    syscall                    # Read it
    move $t1, $v0              # Store b in $t1

    li $v0, 4                  # Print string
    la $a0, valueOfC           # Load string address
    syscall                    # Print

    li $v0, 5                  # Read integer
    syscall                    # Read it
    move $t2, $v0              # Store c in $t2

    # Perform the arithmetic equation: (A + B) * C
    add $t3, $t0, $t1          # t3 = t0 + t1
    mul $t3, $t3, $t2          # t3 = t3 * t2

    # Print the result
    li $v0, 4                  # Print string 
    la $a0, resultTotal3       # Load address of the result message
    syscall                    # Print it

    move $a0, $t3              # Load the result into argument register
    li $v0, 1                  # Print integer 
    syscall                    # Print it

    # Go to next line
	li   $v0, 4            
	la   $a0, newLine     
	syscall

	# Go to next line
	li   $v0, 4            
	la   $a0, newLine     
	syscall

    j menu_loop

exit:
    # Exit the program
    li   $v0, 4            
	la   $a0, exitMsg    
	syscall

    li $v0, 10
    syscall
