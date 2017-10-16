.data 																												
	prompt: .asciiz "Press X when your ready to start..."
	prompt2: .asciiz "Press X if would you like to play again?"
	space: .asciiz "x"
	artist_guess: .space 30
	cap_space: .asciiz "X"
	return: .asciiz "\n"
	return2: .asciiz "\n \n"
	a: .asciiz "a"
	b: .asciiz "b"
	c: .asciiz "c"
	d: .asciiz "d"
	aa: .asciiz "Rihanna\n"
	bb: .asciiz "Kanye West\n"
	cc: .asciiz "Madonna\n"
	dd: .asciiz "Mariah Carey\n"
	question: .asciiz "Can you guess what song this is?"
	question2: .asciiz "Can you guess the artist of this song?"
	text: .asciiz "What song is this: "
	text2: .asciiz "Who sings this: "  
	wrong: .asciiz "Nice try!, SIKE Better Luck next time"
	right: .asciiz "Good Job! you are a music God!"
	buff: .space 12 
	
	answer1: .asciiz "A. Rihanna"
	answer1.2: .asciiz "A. Bit** Better Have My Money"
	lyric1: .asciiz  "Kamikaze if you think that you gon' knock me off the top, Sh**, your wife in the backseat of my brand new foreign car Don't act like you forgot, I call the shots"
	
	answer2: .asciiz "B. Kanye West"
	answer2.2: .asciiz "B. Gold Digger" 
	lyric2: .asciiz "She was spose to buy ya shorty TYCO with ya money She went to the doctor got lypo with ya money She walking around looking like Micheal with ya money Should of got that insured got GEICO for ya money"
	
	answer3: .asciiz "C. Madonna"
	answer3.2: .asciiz "C. Like a Virgin"  
	lyric3: .asciiz "I was beat Incomplete I'd been had, I was sad and blue But you made me feel Yeah, you made me feel Shiny and new"
	
	answer4: .asciiz "D. Mariah Carey"
	answer4.2: .asciiz "D. We Belong Together"
	lyric4: .asciiz "When you left I lost a part of me It's still so hard to believe Come back baby, please"
 

.text
	# Prompt to start game
	start:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 12 
	syscall 
	la $t0, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t1, space
	bne  $t0, $t1, start # start Game When th x button is pressed
	
	#print the Awnser Key	
	li $v0, 4
	la $a0, answer1.2
	syscall
	li $v0, 4 
	la $a0, return  
	syscall	
	
	li $v0, 4
	la $a0, answer2.2
	syscall
	li $v0, 4 
	la $a0, return  
	syscall	
	 
	li $v0, 4
	la $a0, answer3.2
	syscall
	li $v0, 4 
	la $a0, return  
	syscall
	
	li $v0, 4
	la $a0, answer4.2
	syscall
	li $v0, 4 
	la $a0, return2 
	syscall				
	
	title :
	li $v0, 42  
	li $a1, 2
	syscall     
	la $s0, ($a0) #pick random number for random question
	
	li $v0, 42  
	li $a1, 4
	syscall
	la $s1, ($a0) #pick random number for random lyric
	
	ask:
	beq $s0, 0, ask1
	beq $s0, 1, ask2 #if statements for  Which questions

	
	ask1:
	li $v0, 4
	la $a0, question
	syscall
	li $v0, 4 
	la $a0, return
	syscall		#prints the song title question
	
	beq $s1, 0, song1 #if statements for songs
	beq $s1, 1, song2
	beq $s1, 2, song3
	beq $s1, 3, song4
	
	
	song1:		#print BBHMM
	li $v0, 4
	la $a0, lyric1
	syscall
	li $v0, 4 
	la $a0, return
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text
	syscall
	
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t3, a
	beq $t2, $t3, rightAwnser
	bne $t2, $t3, wrongAwnser
	
	song2:		#print Gold Digger
	li $v0, 4
	la $a0, lyric2
	syscall
	li $v0, 4 
	la $a0, return 
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text
	syscall
	
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t3, b
	beq $t2, $t3, rightAwnser
	bne $t2, $t3, wrongAwnser
	
	
	
	song3:		#Print Like A Virgin
	li $v0, 4
	la $a0, lyric3
	syscall
	li $v0, 4 
	la $a0, return
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text
	syscall
	
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t3, c
	beq $t2, $t3, rightAwnser
	bne $t2, $t3, wrongAwnser
	
	
	song4:		#Print We Belong Together
	li $v0, 4
	la $a0, lyric4
	syscall
	li $v0, 4 
	la $a0, return
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text
	syscall
	
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t3, d
	beq $t2, $t3, rightAwnser
	bne $t2, $t3, wrongAwnser
	
	
	
	
	ask2:
	li $v0, 4
	la $a0, question2
	syscall
	li $v0, 4 
	la $a0, return
	syscall		#prints the song title question
	
	beq $s1, 1, song1.2 #If Statement for songs part2 
	beq $s1, 2, song2.2
	beq $s1, 3, song3.2
	beq $s1, 4, song4.2
	
	
	song1.2:		#print BBHMM
	li $v0, 4
	la $a0, lyric1
	syscall
	li $v0, 4 
	la $a0, return  
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text2
	syscall
	
	li $v0, 8
	li $a1, 100000  	#Reads in String
	la $a0, artist_guess
	syscall
	la $t2, ($a0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	la $a1, aa
	move $a0, $t2
	jal compare_strings
	beqz  $t4, rightAwnser
	j  wrongAwnser
	
	
	
	song2.2:		#print Gold Digger
	li $v0, 4
	la $a0, lyric2
	syscall
	li $v0, 4 
	la $a0, return  
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text2
	syscall
	
	#li $v0, 12 	#Reads in Character
	#syscall 
	#la $t2, ($v0)
	#li $v0, 4 
	#la $a0, return2  
	#syscall
	
	li $v0, 8
	li $a1, 100000  	#Reads in String
	la $a0, artist_guess
	syscall
	la $t2, ($a0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	la $a1, bb
	move $a0, $t2
	jal compare_strings
	beqz  $t4, rightAwnser
	j  wrongAwnser
	
	
	
	song3.2:		#Print Like A Virgin
	li $v0, 4
	la $a0, lyric3
	syscall
	li $v0, 4 
	la $a0, return  
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text2
	syscall
	
	li $v0, 8
	li $a1, 100000  	#Reads in String
	la $a0, artist_guess
	syscall
	la $t2, ($a0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	
	la $a1, cc
	move $a0, $t2
	jal compare_strings
	beqz  $t4, rightAwnser
	j  wrongAwnser
	
	
	song4.2:		#Print We Belong Together
	li $v0, 4
	la $a0, lyric4
	syscall
	li $v0, 4 
	la $a0, return 
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text2
	syscall
	
	li $v0, 8
	li $a1, 100000  	#Reads in String
	la $a0, artist_guess
	syscall
	la $t2, ($a0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	
	la $a1, dd
	move $a0, $t2
	jal compare_strings
	beqz  $t4, rightAwnser
	j  wrongAwnser
	
	wrongAwnser:		#Wrong Awnser
	li $v0, 4 
	la $a0, wrong
	syscall
	li $v0, 4 
	la $a0, return2  
	syscall
	li $v0, 4
	la $a0, prompt2		#Press x if you want to play again
	syscall
	
	li $v0, 12 
	syscall 
	la $t0, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t1, space
	beq $t0, $t1, title #if user imput = x loop back to title:
	
	rightAwnser:		#Right Awnser
	li $v0, 4 
	la $a0, right
	syscall
	li $v0, 4 
	la $a0, return2  
	syscall
	
				#enter_num:
	li $v0, 4
	la $a0, prompt2		#Press x if you want to play again
	syscall
	
	li $v0, 12 
	syscall 
	la $t0, ($v0)
	li $v0, 4		#la $s3, space
	la $a0, return2 	#la $s4, cap_space
	syscall			#bne $s3, $t0, enter_num
				#bne $s4, $t0, enter_num

	lb $t1, space
	beq $t0, $t1, title	#if user imput = x loop back to title:
	
	compare_strings:
	lb $t2, ($a0)
	lb $t3, ($a1)
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	bne $t2, $t3, string_not_equal
	bnez $t2, compare_strings
	li $t4, 0 
	jr $ra
	string_not_equal:
	li $t4, 1
	jr $ra
	
	music:
	li $a0, 1
  	li $a1, 100 #1000 is 1sec
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	start:
  li $a0, 90
  li $a1, 500 #1000 is 1sec
  li $a2, 1
  li $a3, 50
  la $v0, 33
  syscall
  li $a0, 100
  li $a1, 500 #1000 is 1sec
  li $a2, 1
  li $a3, 50
  la $v0, 33
  syscall
  li $a0, 90
  li $a1, 500 #1000 is 1sec
  li $a2, 1
  li $a3, 50
  la $v0, 33
  syscall 
  j start
	

	
