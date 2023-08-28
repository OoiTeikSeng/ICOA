.data
aArithValue : .float 0.0
bArithValue : .float 0.0
cArithValue : .float 0.0
resultArith : .float 0.0
newLine		: .asciiz "\n"
warningArith : .asciiz "Only enter in integers!! "
arithmeticA : .asciiz "Enter a value for A: "
arithmeticB : .asciiz "Enter a value for B: "
arithmeticC : .asciiz "Enter a value for C: "
resultTotal : .asciiz "The total of the values are (A + B) / C = "
arithmeticOperation	: .asciiz "You have chose then operation of (A + B) / C "

.text
.globl main

main:
	# Print type of operation 
	li $v0, 4
	la $a0, arithemticOperation
	syscall

	# Go to next line
	li   $v0, 4
	la   $a0, newLine
	syscall	
	
	# Print warning message 
	li $v0, 4
	la $a0, warningArith
	syscall

	# Go to next line
	li   $v0, 4
	la   $a0, newLine
	syscall

	# Print prompt for A
	li   $v0, 4        
	la   $a0, arithmeticA 
	syscall

	# Read value A
	li   $v0, 6        
	syscall
	swc1 $f0, aArithValue   

	# Print prompt for B
	li   $v0, 4        
	la   $a0, arithmeticB 
	syscall

	# Read value B
	li   $v0, 6        
	syscall
	swc1 $f0, bArithValue   

	# Print prompt for C
	li   $v0, 4        
	la   $a0, arithmeticC 
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

	# Exit
	li   $v0, 10           
	syscall
