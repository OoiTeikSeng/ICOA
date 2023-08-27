.data
aValue : .float 0.0
bValue : .float 0.0
cValue : .float 0.0
result : .float 0.0
newLine : .asciiz "\n"
promptA : .asciiz "Enter a value for A: "
promptB : .asciiz "Enter a value for B: "
promptC : .asciiz "Enter a value for C: "
resultMsg : .asciiz "The total of the values are "

.text
.globl main

main :
# Print prompt for A
li   $v0, 4        
la   $a0, promptA 
syscall

# Read aValue
li   $v0, 6        
syscall
swc1 $f0, aValue   

# Print prompt for B
li   $v0, 4        
la   $a0, promptB 
syscall

# Read bValue
li   $v0, 6        
syscall
swc1 $f0, bValue   

# Print prompt for C
li   $v0, 4        
la   $a0, promptC 
syscall

# Read cValue
li   $v0, 6       
syscall
swc1 $f0, cValue   

# Calculate result : (aValue + bValue) / cValue
lwc1 $f4, aValue   
lwc1 $f6, bValue   
lwc1 $f8, cValue   
add.s $f10, $f4, $f6   
div.s $f10, $f10, $f8  
swc1 $f10, result   

# Print result message
li   $v0, 4            
la   $a0, resultMsg   
syscall

# Print result value
lwc1 $f12, result     
li   $v0, 2            
syscall

# Print newline
li   $v0, 4            
la   $a0, newLine     
syscall

# Exit
li   $v0, 10           
syscall



