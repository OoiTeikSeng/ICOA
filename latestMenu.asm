.data
prompt:     .asciiz "Choose an option:\n 1. (A OR B) NOR C\n 2. (A AND B) OR C\n 3. (A OR B) AND C\n 4. (A * B) / C\n 5. (A + B) / C\n 6. (A + B) * C\n 7. Exit\n"
selection	: .asciiz "Choose an operation (1-7): "
invalidMsg  : .asciiz "Invalid input! Please enter again. \n\n"
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
warning : .asciiz "Please enter in integers.\n "
warning1 : .asciiz "The value cannot be 0 !!!\n "
valueOfA : .asciiz "Enter a value for A: "
valueOfB : .asciiz "Enter a value for B: "
valueOfC : .asciiz "Enter a value for C: "
resultTotal1 : .asciiz "The result of (A * B) / C = "
resultTotal2 : .asciiz "The result of (A + B) / C = "
resultTotal3 : .asciiz "The result of (A + B) * C = "
arithmeticOperation1	: .asciiz "You have chose the operation of (A * B) / C "
arithmeticOperation2	: .asciiz "You have chose the operation of (A + B) / C "
arithmeticOperation3	: .asciiz "You have chose the operation of (A + B) * C "
resultLogicMsg1 : .asciiz "The result of (A AND B) NOR C is "
resultLogicMsg2 : .asciiz "The result of (A AND B) NOR C is "
resultLogicMsg3 : .asciiz "The result of (A OR B) AND C is "
logicalOperation1	: .asciiz "You have chose the operation of (A OR B) NOR C"
logicalOperation2	: .asciiz "You have chose the operation of (A AND B) NOR C"
logicalOperation3	: .asciiz "You have chose the operation of (A OR B) AND C"

.text
.globl main

main:
    li $t0, 0                       # Loop control variable

menu_loop:
    # Display menu
    la $a0, prompt                  # Print string
    li $v0, 4                       # Load string address
    syscall                         # Print it
    
	# Print prompt for operation selection
	li   $v0, 4                     # Print string
	la   $a0, selection             # Load string address
	syscall                         # Print it

    # Read user choice
    li $v0, 5                       # Read integer
    syscall                         # Read it
    move $t1, $v0                   # Store user choice in $t1

    # Perform operations based on user choice
    beq $t1, 1, option_1
    beq $t1, 2, option_2
    beq $t1, 3, option_3
    beq $t1, 4, option_4
    beq $t1, 5, option_5
	beq $t1, 6, option_6
    beq $t1, 7, exit
    j invalidChoice                 # Invalid choice, repeat menu loop

option_1:
    # Print operation type
    li $v0, 4                       # Print string
    la $a0, logicalOperation1       # Load string address
    syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    # Print warning message
    li $v0, 4                       # Print string        
    la $a0, warning                 # Load string address
    syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    # Print prompt for A
    li $v0, 4                       # Print string
    la $a0, valueOfA                # Load string address
    syscall                         # Print it

    # Read value A
    li $v0, 5                       # Read integer 
    syscall                         # Read it 
    sw $v0, aLogicValue             # Store a in $v0

    # Print prompt for B
    li $v0, 4                       # Print string
    la $a0, valueOfB                # Load string address
    syscall                         # Print it

    # Read value B
    li $v0, 5                       # Read integer
    syscall                         # Read it
    sw $v0, bLogicValue             # Store c in $v0

    #Print prompt for C
    li $v0, 4                       # Print string
    la $a0, valueOfC                # Load string address
    syscall                         # Print it

    # Read value C
    li $v0, 5                       # Read integer
    syscall                         # Read it
    sw $v0, cLogicValue             # Store c in $v0

    # Load values for the logical operation
    lw   $t0, aLogicValue
    lw   $t1, bLogicValue
    lw   $t2, cLogicValue

    # Perform (A OR B) NOR C
    or   $t3, $t0, $t1              # Perform A OR B
    nor  $t4, $t3, $t2              # Perform (A OR B) NOR C
    sw   $t4, resultLogic

    # Print result message
    li $v0, 4                       # Print string
    la $a0, resultLogicMsg1         # Load string address
    syscall                         # Print it

    # Print result value
    lw $a0, resultLogic             # Load the result into argument register
    li $v0, 1                       # Print result
    syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

j menu_loop

option_2:
	# Print type of operation 
	li $v0, 4                       # Print string
	la $a0, logicalOperation2       # Load string address
	syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    # Print warning message
    li $v0, 4                       # Print string        
    la $a0, warning                 # Load string address
    syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    # Print prompt for A
    li $v0, 4                       # Print string 
    la $a0, valueOfA                # Load string address
    syscall                         # Print it

    # Read value A
    li   $v0, 5                     # Read integer
    syscall                         # Read it
    sw   $v0, aLogicValue           # Store a in $v0

    # Print prompt for B
    li   $v0, 4                     # Print string
    la   $a0, valueOfB              # Load string address 
    syscall                         # Print it

    # Read value B
    li   $v0, 5                     # Read integer
    syscall                         # Read it
    sw   $v0, bLogicValue           # Store b in $v0

    # Print prompt for C
    li   $v0, 4                     # Print string
    la   $a0, valueOfC              # Load string address
    syscall                         # Print it

    # Read value C
    li   $v0, 5                     # Read integer 
    syscall                         # Read it
    sw   $v0, cLogicValue           # Store c in $v0

    # Load values for the logical operation
    lw   $t0, aLogicValue           # Load a into $t0
    lw   $t1, bLogicValue           # Load b into $t1
    lw   $t2, cLogicValue           # Load c into $t2

    # Perform (A OR B)
    and  $t3, $t0, $t1              # $t3 = $t0 OR $t1

    # Perform (A AND B) OR C
    nor   $t4, $t3, $t2             # $t4 = $t2 NOR $t3
    sw   $t4, resultLogic           # Store result into resultLogic

    # Print result message
    li   $v0, 4                     # Print string
    la   $a0, resultLogicMsg2       # Load string address
    syscall                         # Print it 

    # Print result value
    lw   $a0, resultLogic           # Load result to the argument register
    li   $v0, 1                     # Print integer
    syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    j menu_loop

option_3:
    # Print type of operation 
	li $v0, 4                       # Print string
	la $a0, logicalOperation3       # Load string address
	syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    # Print warning message
    li $v0, 4                       # Print string        
    la $a0, warning                 # Load string address
    syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    # Display prompt for the first integer
    li $v0, 4                       # Print string 
    la $a0, valueOfA                # Load string address
    syscall                         # Print it
    
    # Read the first integer from the user
    li $v0, 5                       # Read integer
    syscall                         # Read it
    move $t0, $v0                   # Store a into $t0
    
    # Display prompt for the second integer
    li $v0, 4                       # Print string
    la $a0, valueOfB                # Load string address
    syscall                         # Print it
    
    # Read the second integer from the user
    li $v0, 5                       # Read integer
    syscall                         # Read it
    move $t1, $v0                   # Store b into $t1

    # Display prompt for the third integer
    li $v0, 4                       # Print string
    la $a0, valueOfC                # Load string address
    syscall                         # Print it
    
    # Read the third integer from the user
    li $v0, 5                       # Read integer
    syscall                         # Read it
    move $t2, $v0                   # Store c into $t2
    
    # Perform OR operation and AND operation
    or $t3, $t0, $t1                # $t2 = $t0 OR $t1
    and $t3, $t2, $t3               # $t4 = $t2 AND $t3
    
    # Display the result label
    li $v0, 4                       # Print string
    la $a0, resultLogicMsg3         # Load string address
    syscall                         # Print it

    move $a0, $t3                   # Store result into argument register
    li $v0, 1                       # Print result
    syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    j menu_loop

option_4:
    # Print operation type
    li $v0, 4                       # Print string
    la $a0, arithmeticOperation1    # Load string address   
    syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    # Print warning message
    li $v0, 4                       # Print string        
    la $a0, warning                 # Load string address
    syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    # Get A value
    li $v0, 4                       # Print string 
    la $a0, valueOfA                # Load string address
    syscall                         # Print it

    li $v0, 6
    syscall
    mov.s $f5, $f0

    # Get B value
    li $v0, 4
    la $a0, valueOfB
    syscall
    li $v0, 6
    syscall
    mov.s $f6, $f0

    # Get C value
    li $v0, 4
    la $a0, valueOfC
    syscall
    li $v0, 6
    syscall
    mov.s $f7, $f0

    # Check if C is zero
    li.s   $f10, 0.0      
    c.eq.s $f7, $f10        
    bc1t   div_by_zero        

    # Perform (A * B) / C
    mul.s $f8, $f5, $f6
    div.s $f9, $f8, $f7

    # Print result
    li $v0, 4                       # Print string  
    la $a0, resultTotal1            # Load string address
    syscall                         # Print it

    li $v0, 2                       
    mov.s $f12, $f9
    syscall

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it
    
    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    j menu_loop

    div_by_zero:
    li $v0, 4
    la $a0, warning1
    syscall

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    j menu_loop

option_5:
    # Print type of operation 
	li $v0, 4                       # Print string
	la $a0, arithmeticOperation2    # Load string address
	syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it
	
    # Print warning message
    li $v0, 4                       # Print string        
    la $a0, warning                 # Load string address
    syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

	# Print prompt for A
    li $v0, 4                       # Print string 
    la $a0, valueOfA                # Load string address
    syscall                         # Print it

	# Read value A
	li   $v0, 6                     # Read integer
	syscall                         # Read it
	swc1 $f0, aArithValue           # Store a into $f0

	# Print prompt for B
	li   $v0, 4                     # Print string
	la   $a0, valueOfB              # Load string address
	syscall                         # Print it

	# Read value B
	li   $v0, 6                     # Read integer
	syscall                         # Read it
	swc1 $f0, bArithValue           # Store b into $f0

	# Print prompt for C
	li   $v0, 4                     # Print string
	la   $a0, valueOfC              # Load string address
	syscall                         # Print it

	# Read value C
	li   $v0, 6                     # Read integer
	syscall                         # Read it
	swc1 $f0, cArithValue           # Store c into $f0

	# Calculate result : (aArithValue + bArithValue) / cArithValue
	lwc1 $f4, aArithValue           # Load a into $f4
	lwc1 $f6, bArithValue           # Load b into $f6
	lwc1 $f8, cArithValue           # Load c into $f8
	add.s $f10, $f4, $f6            # Perform A + B
	div.s $f10, $f10, $f8           # Perform (A + B) / C
	swc1 $f10, resultArith          # Store result into $f10

	# Print result message
	li   $v0, 4                     # Print string
	la   $a0, resultTotal2          # Load string address
	syscall                         # Print it

	# Print result value
	lwc1 $f12, resultArith          # Load result into $f12
	li   $v0, 2                     # Print result
	syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it
    
    j menu_loop

option_6:
    # Print type of operation 
	li $v0, 4                       # Print string
	la $a0, arithmeticOperation3    # Load string address
	syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    # Print warning message
    li $v0, 4                       # Print string        
    la $a0, warning                 # Load string address
    syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    # Print prompts and get user inputs
    li $v0, 4                       # Print string 
    la $a0, valueOfA                # Load string address
    syscall                         # Print it

    li $v0, 5                       # Read integer
    syscall                         # Read it
    move $t0, $v0                   # Store a in $t0

    li $v0, 4                       # Print string 
    la $a0, valueOfB                # Load string address 
    syscall

    li $v0, 5                       # Read integer 
    syscall                         # Read it
    move $t1, $v0                   # Store b in $t1

    li $v0, 4                       # Print string
    la $a0, valueOfC                # Load string address
    syscall                         # Print it

    li $v0, 5                       # Read integer
    syscall                         # Read it
    move $t2, $v0                   # Store c in $t2

    # Perform the arithmetic equation: (A + B) * C
    add $t3, $t0, $t1               # t3 = t0 + t1
    mul $t3, $t3, $t2               # t3 = t3 * t2

    # Print the result
    li $v0, 4                       # Print string 
    la $a0, resultTotal3            # Load address of the result message
    syscall                         # Print it

    move $a0, $t3                   # Load the result into argument register
    li $v0, 1                       # Print result 
    syscall                         # Print it

    # Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

	# Go to next line
	li   $v0, 4                     # Print string
	la   $a0, newLine               # Load string address 
	syscall                         # Print it

    j menu_loop

invalidChoice:
    # Print the invalid message
    li $v0, 4                       # Print string
    la $a0, invalidMsg              # Load string address
    syscall                         # Print it

    j menu_loop

exit:
    # Print exit message
    li   $v0, 4                     # Print string
	la   $a0, exitMsg               # Load string address
	syscall                         # Print it

    # Exit the program
    li $v0, 10                      
    syscall
