.data 
	hell0: .asciiz "HELLO WORLLD"
.text 
	li $v0, 4  #Sets v0 to 4
	la $a0, hello  #a0 = "hello World"
	syscall
	
	li $v0, 10  #end program
	syscall