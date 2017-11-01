.data 	
	art: .ascii "(                          *                               \n"
	" )\\ )                     (  `                 )            \n"
	"(()/(             (  (    )\))(      )      ( /(   (   (    \n"
	" /(_)) (    (     )\))(  ((_)()\\  ( /(  (   )\()) ))\  )(   \n"
	"(_))   )\   )\\ ) ((_))\  (_()((_) )(_)) )\\ (_))/ /((_)(()\  \n"
	"/ __| ((_) _(_/(  (()(_) |  \\/  |((_)_ ((_)| |_ (_))   ((_) \n"
	"\\__ \\/ _ \\| ' \\))/ _` |  | |\\/| |/ _` |(_-<|  _|/ -_) | '_| \n"
	"|___/\\___/|_||_| \\__, |  |_|  |_|\\__,_|/__/ \\__|\\___| |_|   \n"
	"                 |___/                                      \n"																										
	prompt: .asciiz "Press X when your ready to start..."
	prompt2: .asciiz "Press X if would you like to play again? or Press Z if you would like to quit"
	prompt3: .asciiz "Press M if you would like a hint, Press any other button if you think you can handle the challenge!"
	space: .asciiz "x"
	sorry: .asciiz "Sorry not hint for this one! A true music god doesnt need one" 
	z: .asciiz "z"
	m: .asciiz "m"
	m2: .asciiz "m/n"
	artist_guess: .space 30
	cap_space: .asciiz "X"
	return: .asciiz "\n"
	return2: .asciiz "\n \n"
	genre: .asciiz "A. Rap and R&B"
	genre2: .asciiz "B. Classics"
	genre3:.asciiz "C. Recent Hits" 
	a: .asciiz "a"
	b: .asciiz "b"
	c: .asciiz "c"
	d: .asciiz "d"
	aa: .asciiz "Rihanna\n"
	bb: .asciiz "Kanye West\n"
	cc: .asciiz "Madonna\n"
	dd: .asciiz "Mariah Carey\n"
	ee: .asciiz "Frank Ocean\n"
	ff: .asciiz "Rihanna\n"
	gg: .asciiz "Al Green\n"
	hh: .asciiz "TLC\n"
	ii: .asciiz "Red Hot Chili Peppers\n"
	jj: .asciiz "Childish Gambino\n"
	kk: .asciiz "SZA\n"
	mm: .asciiz "The Weeknd\n"
	question: .asciiz "Can you guess WHAT SONG this is?"
	question2: .asciiz "Can you guess the ARTIST of this song?"
	text: .asciiz "What song is this: "
	text2: .asciiz "Who sings this: "  
	wrong: .asciiz "Nice try!, SIKE Better Luck next time"
	right: .asciiz "Good Job! you are a music God!"
	buff: .space 12 
	
	answerkey_rap: .ascii 	"A. Runaway\n"
				"B. Thinkin Bout You\n" 
				"C. Stay\n"
				"D. Lets Stay Together\n"
				"M. Want a Hint?\n"
	asciiz: .asciiz " \n"
	rap_lyric1: .asciiz "I always find somethin wrong You been puttin up with my sh** just way too long I'm so gifted at findin what I don't like the most So I think it's time for us to have a toast"
	rap_lyric2: .asciiz "A tornado flew around my room before you came Excuse the mess it made, it usually doesn't rain in Southern California"
	rap_lyric3: .asciiz "Not really sure how to feel about it Something in the way you move Makes me feel like I can't live without you It takes me all the way"
	rap_lyric4: .asciiz "I'm so in love with you Whatever you want to do Is all right with me"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	answerkey_classics: .ascii 	"A. Like a Virgin\n"
					"B. We Belong Together\n"
					"C. No Scrubs\n"
					"D. Dani California\n"
					"M. Want a Hint?\n"  
	asciiz2: .asciiz " \n"
	classic_lyric1: .asciiz "I was beat Incomplete I'd been had, I was sad and blue But you made me feel Yeah, you made me feel Shiny and new"
	classic_lyric2: .asciiz "When you left I lost a part of me It's still so hard to believe Come back baby, please"
	classic_lyric3: .asciiz "His game is kinda weak And I know that he cannot approach me, Cause I'm looking like class, and he's looking like trash"
	classic_lyric4: .asciiz "born in the state of Mississippi poppa was a copper and her momma was a hippie In Alabama she would swing a hammer Price you gotta pay when you break the panorama"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
	answerkey_hits: .ascii 	"A. Bit** Better Have My Money\n"
				"B. Redbone\n"
				"C. Love Galore\n"
				"D. Starboy\n"
				"M. Want a Hint?\n"
	asciiz3: .asciiz " \n"
	hit_lyric1: .asciiz  "Kamikaze if you think that you gon' knock me off the top, Sh**, your wife in the backseat of my brand new foreign car Don't act like you forgot, I call the shots"
	hit_lyric2: .asciiz "You wanna make it right, but now it's too late my peanut butter chocolate cake with Kool-Aid I'm trying not to waste my time "
	hit_lyric3: .asciiz "Dig dirt on b**ches, Do it for fun, Don't take it personal baby, Love 'em all lately, Luh-love to my ladies, I dated a few"
	hit_lyric4: .asciiz "You talking money, need a hearing aid, You talking 'bout me, I don't see a shade, Switch up my style, I take any lane"

.text	
	start:
	li $v0, 4	#AScii Art
	la $a0, art
	syscall
	
	# Prompt to start game
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
	
	front:
	li $v0, 4	#Prints Genre Question
	la $a0, genre
	syscall
	li $v0, 4 
	la $a0, return  
	syscall
	li $v0, 4
	la $a0, genre2
	syscall
	li $v0, 4 
	la $a0, return  
	syscall
	li $v0, 4
	la $a0, genre3
	syscall
	li $v0, 4 
	la $a0, return  
	syscall
	
	li $v0, 12 	#Reads in Character
	syscall 
	la $t5, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t6, a	#choose genre
	lb $t7, b
	lb $t8, c
	
	li $v0, 42  
	li $a1, 2
	syscall     
	la $s0, ($a0) #pick random number for random question
	
	li $v0, 42  
	li $a1, 4
	syscall
	la $s1, ($a0) #pick random number for random lyric
	
	beq $t5, $t6, rap
	beq $t5, $t7, classics
	beq $t5, $t8, hits
	
	rap: #########################################################################################################################################################################
	li $v0, 42  
	li $a1, 2
	syscall     
	la $s0, ($a0) #pick random number for random question
	
	li $v0, 42  
	li $a1, 4
	syscall
	la $s1, ($a0) #pick random number for random lyric
	
	beq $s0, 0, rapAsk1
	beq $s0, 1, rapAsk2 #if statements for  Which questions
	
	rapAsk1:
	li $v0, 4	#prints the song title question
	la $a0, question
	syscall
	li $v0, 4 
	la $a0, return2
	syscall	
			#print the Awnser Key
	li $v0, 4
	la $a0, answerkey_rap
	syscall
	li $v0, 4 
	la $a0, return
	syscall	
	
	
	beq $s1, 0, rap1 #if statements for songs
	beq $s1, 1, rap2
	beq $s1, 2, rap3
	beq $s1, 3, rap4
	
	rap1:		#print Runaway
	li $v0, 4
	la $a0, rap_lyric1
	syscall
	li $v0, 4 
	la $a0, return 
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text
	syscall	
	
	decoy1:
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall

	lb $t3, c
	lb $t4, m
	beq $t2, $t4, runaway
	beq $t2, $t3, rap_rightAwnser
	bne $t2, $t3, rap_wrongAwnser
	
	rap2:		#print Thinkin About You
	li $v0, 4
	la $a0, rap_lyric2
	syscall
	li $v0, 4 
	la $a0, return 
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text
	syscall
	
	decoy2:
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall

	lb $t3, b
	lb $t4, m
	beq $t2, $t4, thinkin
	beq $t2, $t3, rap_rightAwnser
	bne $t2, $t3, rap_wrongAwnser
	
	rap3:	#print Stay 
	li $v0, 4
	la $a0, rap_lyric3
	syscall
	li $v0, 4 
	la $a0, return 
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text
	syscall	
	
	decoy3:
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall

	lb $t3, c
	lb $t4, m
	beq $t2, $t4, stay 
	beq $t2, $t3, rap_rightAwnser
	bne $t2, $t3, rap_wrongAwnser
	
	rap4:		#print Lets Stay Together
	li $v0, 4
	la $a0, rap_lyric4
	syscall
	li $v0, 4 
	la $a0, return 
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text
	syscall
	
	decoy4:
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t3, d
	lb $t4, m
	beq $t2, $t4, letsstay
	beq $t2, $t3, rap_rightAwnser
	bne $t2, $t3, rap_wrongAwnser
#-------------------------------------------------
	rapAsk2:
	li $v0, 4
	la $a0, question2
	syscall
	li $v0, 4 
	la $a0, return
	syscall		#prints the song title question
	
	beq $s1, 1, rap1.2 #If Statement for songs part2 
	beq $s1, 2, rap2.2
	beq $s1, 3, rap3.2
	beq $s1, 4, rap4.2
	
	rap1.2:		#print Gold Digger
	li $v0, 4 
	la $a0, prompt3
	syscall
	li $v0, 4 
	la $a0, return  
	syscall	
	li $v0, 4
	la $a0, rap_lyric1
	syscall
	li $v0, 4 
	la $a0, return  
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text2
	syscall
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall	
	
	lb $t4, m
	beq $t2, $t4, runaway 
	bne $t2, $t4, decoy1.2
	
	decoy1.2:
	li $v0, 8
	li $a1, 100000  	#Reads in String
	la $a0, artist_guess
	syscall
	la $t2, ($a0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t4, m2 
	la $a1, bb
	move $a0, $t2
	jal compare_strings
	beqz  $t4, rap_rightAwnser
	j  rap_wrongAwnser
	
	rap2.2:		#print Thinkin Bout You 
	li $v0, 4 
	la $a0, prompt3
	syscall
	li $v0, 4 
	la $a0, return  
	syscall	
	li $v0, 4
	la $a0, rap_lyric2
	syscall
	li $v0, 4 
	la $a0, return  
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text2
	syscall
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall		
	lb $t4, m
	beq $t2, $t4, thinkin
	bne $t2, $t4, decoy2.2
	
	decoy2.2:
	li $v0, 8
	li $a1, 100000  	#Reads in String
	la $a0, artist_guess
	syscall
	la $t2, ($a0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t4, m2 
	la $a1, ee
	move $a0, $t2
	jal compare_strings
	beqz  $t4, rap_rightAwnser
	j  rap_wrongAwnser
	
	rap3.2:		#print Stay  
	li $v0, 4 
	la $a0, prompt3
	syscall
	li $v0, 4 
	la $a0, return  
	syscall	
	li $v0, 4
	la $a0, rap_lyric3
	syscall
	li $v0, 4 
	la $a0, return  
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text2
	syscall
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall		
	lb $t4, m
	beq $t2, $t4, stay 
	bne $t2, $t4, decoy3.2
	
	decoy3.2:
	li $v0, 8
	li $a1, 100000  	#Reads in String
	la $a0, artist_guess
	syscall
	la $t2, ($a0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t4, m2 
	la $a1, ff
	move $a0, $t2
	jal compare_strings
	beqz  $t4, rap_rightAwnser
	j  rap_wrongAwnser
	
	rap4.2:		#print lets stay together
	li $v0, 4 
	la $a0, prompt3
	syscall
	li $v0, 4 
	la $a0, return  
	syscall	
	li $v0, 4
	la $a0, rap_lyric4
	syscall
	li $v0, 4 
	la $a0, return  
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text2
	syscall
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall		
	lb $t4, m
	beq $t2, $t4, letsstay 
	bne $t2, $t4, decoy4.2
	
	decoy4.2:
	li $v0, 8
	li $a1, 100000  	#Reads in String
	la $a0, artist_guess
	syscall
	la $t2, ($a0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t4, m2 
	la $a1, gg
	move $a0, $t2
	jal compare_strings
	beqz  $t4, rap_rightAwnser
	j  rap_wrongAwnser
	
	classics: #########################################################################################################################################################################
	li $v0, 42  
	li $a1, 2
	syscall     
	la $s0, ($a0) #pick random number for random question
	
	li $v0, 42  
	li $a1, 4
	syscall
	la $s1, ($a0) #pick random number for random lyric
	
	beq $s0, 0, classicAsk1
	beq $s0, 1, classicAsk2 #if statements for  Which questions
	
	classicAsk1:
	li $v0, 4	#prints the song title question
	la $a0, question
	syscall
	li $v0, 4 
	la $a0, return2
	syscall	
			#print the Awnser Key
	li $v0, 4
	la $a0, answerkey_classics
	syscall
	
	
	beq $s1, 0, classic1 #if statements for songs
	beq $s1, 1, classic2
	beq $s1, 2, classic3
	beq $s1, 3, classic4
	
	classic1:		#Print Like A Virgin
	li $v0, 4
	la $a0, classic_lyric1
	syscall
	li $v0, 4 
	la $a0, return
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text
	syscall
	
	decoy1C:
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t3, a
	lb $t4, m
	beq $t2, $t4, virgin
	beq $t2, $t3, classic_rightAwnser
	bne $t2, $t3, classic_wrongAwnser
	
	
	classic2:		#Print We Belong Together
	li $v0, 4
	la $a0, classic_lyric2
	syscall
	li $v0, 4 
	la $a0, return
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text
	syscall
	
	decoy2C:
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t3, b
	lb $t4, m
	beq $t2, $t4, belong
	beq $t2, $t3, classic_rightAwnser
	bne $t2, $t3, classic_wrongAwnser
	
	
	classic3:		#Print No Scrubs
	li $v0, 4
	la $a0, classic_lyric3
	syscall
	li $v0, 4 
	la $a0, return
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text
	syscall
	
	decoy3C:
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t3, c
	lb $t4, m
	beq $t2, $t4, scrubs
	beq $t2, $t3, classic_rightAwnser
	bne $t2, $t3, classic_wrongAwnser
	
	classic4:		#Print Dani California 
	li $v0, 4
	la $a0, classic_lyric4
	syscall
	li $v0, 4 
	la $a0, return
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text
	syscall
	
	decoy4C:
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t3, d
	lb $t4, m
	beq $t2, $t4, dani
	beq $t2, $t3, classic_rightAwnser
	bne $t2, $t3, classic_wrongAwnser
#------------------------------------------------------------------------------------------
	classicAsk2:
	li $v0, 4
	la $a0, question2
	syscall
	li $v0, 4 
	la $a0, return
	syscall		#prints the song title question
	
	beq $s1, 1, classic1.2 #If Statement for songs part2 
	beq $s1, 2, classic2.2
	beq $s1, 3, classic3.2
	beq $s1, 4, classic4.2
	
	classic1.2:		#Print Like A Virgin
	li $v0, 4 
	la $a0, prompt3
	syscall
	li $v0, 4 
	la $a0, return  
	syscall	
	li $v0, 4
	la $a0, classic_lyric1
	syscall
	li $v0, 4 
	la $a0, return  
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text2
	syscall
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall		
	lb $t4, m
	beq $t2, $t4, virgin 
	bne $t2, $t4, decoy1C.2
	
	decoy1C.2:
	li $v0, 8
	li $a1, 100000  	#Reads in String
	la $a0, artist_guess
	syscall
	la $t2, ($a0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t4, m2 
	la $a1, cc
	move $a0, $t2
	jal compare_strings
	beqz  $t4, classic_rightAwnser
	j  classic_wrongAwnser
	
	
	classic2.2:		#Print We Belong Together
	li $v0, 4 
	la $a0, prompt3
	syscall
	li $v0, 4 
	la $a0, return  
	syscall	
	li $v0, 4
	la $a0, classic_lyric2
	syscall
	li $v0, 4 
	la $a0, return  
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text2
	syscall
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall		
	lb $t4, m
	beq $t2, $t4, belong 
	bne $t2, $t4, decoy2C.2
	
	decoy2C.2:
	li $v0, 8
	li $a1, 100000  	#Reads in String
	la $a0, artist_guess
	syscall
	la $t2, ($a0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t4, m2 
	la $a1, dd
	move $a0, $t2
	jal compare_strings
	beqz  $t4, classic_rightAwnser
	j  classic_wrongAwnser
	
	classic3.2:		#Print No Scrubs 
	li $v0, 4 
	la $a0, prompt3
	syscall
	li $v0, 4 
	la $a0, return  
	syscall	
	li $v0, 4
	la $a0, classic_lyric3
	syscall
	li $v0, 4 
	la $a0, return  
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text2
	syscall
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall		
	lb $t4, m
	beq $t2, $t4, scrubs 
	bne $t2, $t4, decoy3C.2
	
	decoy3C.2:
	li $v0, 8
	li $a1, 100000  	#Reads in String
	la $a0, artist_guess
	syscall
	la $t2, ($a0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t4, m2 
	la $a1, hh
	move $a0, $t2
	jal compare_strings
	beqz  $t4, classic_rightAwnser
	j  classic_wrongAwnser
	
	classic4.2:		#Print Dani California
	li $v0, 4 
	la $a0, prompt3
	syscall
	li $v0, 4 
	la $a0, return  
	syscall	
	li $v0, 4
	la $a0, classic_lyric4
	syscall
	li $v0, 4 
	la $a0, return  
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text2
	syscall
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall		
	lb $t4, m
	beq $t2, $t4, dani
	bne $t2, $t4, decoy4C.2
	
	decoy4C.2:
	li $v0, 8
	li $a1, 100000  	#Reads in String
	la $a0, artist_guess
	syscall
	la $t2, ($a0)
	li $v0, 4 
	la $a0, return2  
	syscall
	li $v0, 8
	li $a1, 100000  	#Reads in String
	la $a0, artist_guess
	syscall
	la $t2, ($a0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t4, m2 
	la $a1, ii
	move $a0, $t2
	jal compare_strings
	beqz  $t4, classic_rightAwnser
	j  classic_wrongAwnser


	hits: #########################################################################################################################################################################
	li $v0, 42  
	li $a1, 2
	syscall     
	la $s0, ($a0) #pick random number for random question
	
	li $v0, 42  
	li $a1, 4
	syscall
	la $s1, ($a0) #pick random number for random lyric
	
	beq $s0, 0, hitAsk1
	beq $s0, 1, hitAsk2 #if statements for  Which questions
	
	hitAsk1:
	li $v0, 4	#prints the song title question
	la $a0, question
	syscall
	li $v0, 4 
	la $a0, return2
	syscall
			#print the Awnser Key
	li $v0, 4
	la $a0, answerkey_hits
	syscall
	li $v0, 4 
	la $a0, return 		
	
	beq $s1, 0, hit1 #if statements for songs
	beq $s1, 1, hit2
	beq $s1, 2, hit3
	beq $s1, 3, hit4
	
	hit1:		#print BBHMM
	li $v0, 4
	la $a0, hit_lyric1
	syscall
	li $v0, 4 
	la $a0, return
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text
	syscall
	
	decoy1H:
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t3, a
	lb $t4, m
	beq $t2, $t4, bbhmm
	beq $t2, $t3, hit_rightAwnser
	bne $t2, $t3, hit_wrongAwnser
	
	hit2:		#print Redbone
	li $v0, 4
	la $a0, hit_lyric2
	syscall
	li $v0, 4 
	la $a0, return
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text
	syscall
	
	decoy2H:
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t3, b
	lb $t4, m
	beq $t2, $t4, redbone
	beq $t2, $t3, hit_rightAwnser
	bne $t2, $t3, hit_wrongAwnser
	
	hit3:		#print Love Galore 
	li $v0, 4
	la $a0, hit_lyric3
	syscall
	li $v0, 4 
	la $a0, return
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text
	syscall
	
	decoy3H:
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t3, c
	lb $t4, m
	beq $t2, $t4, lovegalore
	beq $t2, $t3, hit_rightAwnser
	bne $t2, $t3, hit_wrongAwnser
	
	hit4:		#print Starboy
	li $v0, 4
	la $a0, hit_lyric4
	syscall
	li $v0, 4 
	la $a0, return
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text
	syscall
	
	decoy4H:
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t3, d
	lb $t4, m
	beq $t2, $t4, starboy
	beq $t2, $t3, hit_rightAwnser
	bne $t2, $t3, hit_wrongAwnser
#-----------------------------------------------------------------------------------------------
	hitAsk2:
	li $v0, 4
	la $a0, question2
	syscall
	li $v0, 4 
	la $a0, return
	syscall		#prints the song title question
	
	beq $s1, 1, hit1.2 #If Statement for songs part2 
	beq $s1, 2, hit2.2
	beq $s1, 3, hit3.2
	beq $s1, 4, hit4.2
	
	
	hit1.2:		#print BBHMM
	li $v0, 4 
	la $a0, prompt3
	syscall
	li $v0, 4 
	la $a0, return  
	syscall	
	li $v0, 4
	la $a0, hit_lyric1
	syscall
	li $v0, 4 
	la $a0, return  
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text2
	syscall
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall	
	lb $t4, m
	beq $t2, $t4, bbhmm
	bne $t2, $t4, decoy1H.2
	
	decoy1H.2:
	li $v0, 8
	li $a1, 100000  	#Reads in String
	la $a0, artist_guess
	syscall
	la $t2, ($a0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t4, m2
	la $a1, aa
	move $a0, $t2
	jal compare_strings
	beqz  $t4, hit_rightAwnser
	j  hit_wrongAwnser
	
	hit2.2:		#print Redbone
	li $v0, 4 
	la $a0, prompt3
	syscall
	li $v0, 4 
	la $a0, return  
	syscall	
	li $v0, 4
	la $a0, hit_lyric2
	syscall
	li $v0, 4 
	la $a0, return  
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text2
	syscall
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall	
	lb $t4, m
	beq $t2, $t4, redbone
	bne $t2, $t4, decoy2H.2
	
	decoy2H.2:
	li $v0, 8
	li $a1, 100000  	#Reads in String
	la $a0, artist_guess
	syscall
	la $t2, ($a0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t4, m2
	la $a1, jj
	move $a0, $t2
	jal compare_strings
	beqz  $t4, hit_rightAwnser
	j  hit_wrongAwnser
	
	hit3.2:		#print Love Galore
	li $v0, 4 
	la $a0, prompt3
	syscall
	li $v0, 4 
	la $a0, return  
	syscall	
	li $v0, 4
	la $a0, hit_lyric3
	syscall
	li $v0, 4 
	la $a0, return  
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text2
	syscall
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall	
	lb $t4, m
	beq $t2, $t4, lovegalore
	bne $t2, $t4, decoy3H.2
	
	decoy3H.2:
	li $v0, 8
	li $a1, 100000  	#Reads in String
	la $a0, artist_guess
	syscall
	la $t2, ($a0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t4, m2
	la $a1, kk
	move $a0, $t2
	jal compare_strings
	beqz  $t4, hit_rightAwnser
	j  hit_wrongAwnser
	
	hit4.2:		#print Starboy
	li $v0, 4 
	la $a0, prompt3
	syscall
	li $v0, 4 
	la $a0, return  
	syscall	
	li $v0, 4
	la $a0, hit_lyric4
	syscall
	li $v0, 4 
	la $a0, return  
	syscall		
	li $v0, 4	#Prompt for the question
	la $a0, text2
	syscall
	li $v0, 12 	#Reads in Character
	syscall 
	la $t2, ($v0)
	li $v0, 4 
	la $a0, return2  
	syscall	
	lb $t4, m
	beq $t2, $t4, starboy
	bne $t2, $t4, decoy4H.2
	
	decoy4H.2:
	li $v0, 8
	li $a1, 100000  	#Reads in String
	la $a0, artist_guess
	syscall
	la $t2, ($a0)
	li $v0, 4 
	la $a0, return2  
	syscall
	
	lb $t4, m2
	la $a1, mm
	move $a0, $t2
	jal compare_strings
	beqz  $t4, hit_rightAwnser
	j  hit_wrongAwnser
	
#=========================================================================================================	
	rap_wrongAwnser:		#Wrong Awnser
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
	lb $t7, z
	beq $t0, $t1, rap #if user imput = x loop back to title:
	beq $t0, $t7, start #if user imput = z loop back to start
	
	classic_wrongAwnser:		#Wrong Awnser
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
	lb $t7, z
	beq $t0, $t1, classics #if user imput = x loop back to title:
	beq $t0, $t7, start #if user imput = z loop back to start
	
	hit_wrongAwnser:		#Wrong Awnser
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
	lb $t7, z
	beq $t0, $t1, hits #if user imput = x loop back to title:
	beq $t0, $t7, start #if user imput = z loop back to start
#===========================================================================================================	
	rap_rightAwnser:		#Right Awnser
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
	lb $t7, z
	beq $t0, $t1, rap #if user imput = x loop back to title:
	beq $t0, $t7, start #if user imput = z loop back to start
	
	classic_rightAwnser:		#Right Awnser
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
	lb $t7, z
	beq $t0, $t1, classics #if user imput = x loop back to title:
	beq $t0, $t7, start #if user imput = z loop back to start
	
	hit_rightAwnser:		#Right Awnser
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
	lb $t7, z
	beq $t0, $t1, hits #if user imput = x loop back to title:
	beq $t0, $t7, start #if user imput = z loop back to start
	
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

	#|-|-|-|-|-|-|-||-|-|-|-|-|-|-|-|-|-|-|-|-|-||-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-||-|-|-|-|-|-|-|
	#				SONGS/ MUSIC FOR THE TEST 
	
	stay:		#####STAY
	li $a0, 55 #low G     #chord 1
  	li $a1, 500 
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 64
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 55 #low G	 #chord 1
  	li $a1, 500 
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 64
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 55 #low G	 #chord 1
  	li $a1, 500 
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 64
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall	
  	li $a0, 57 #low a	 #chord 2
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 62
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 65
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 57 #low a	 #chord 3
  	li $a1, 500 
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 654
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 57#low a	 #chord 3
  	li $a1, 500 
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 654
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 57 #low a	 #chord 3
  	li $a1, 500 
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 654
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 55 #low G	 #chord 1
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 64
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 57 #low a	 #chord 3
  	li $a1, 500 
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 654
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 57 #low a	 #chord 3
  	li $a1, 500 
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 654
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 57 #low a	 #chord 3
  	li $a1, 500 
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 654
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 55 #low G	 #chord 1
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 64
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 55 #low G     #chord 1
  	li $a1, 500 
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 64
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 55 #low G	 #chord 1
  	li $a1, 500 
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 64
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 55 #low G	 #chord 1
  	li $a1, 500 
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 64
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall	
  	li $a0, 57 #low a	 #chord 2
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 62
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 65
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 57 #low a	 #chord 3
  	li $a1, 500 
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 654
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 57#low a	 #chord 3
  	li $a1, 500 
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 654
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 57 #low a	 #chord 3
  	li $a1, 500 
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 654
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 55 #low G	 #chord 1
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 64
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 57 #low a	 #chord 3
  	li $a1, 500 
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 654
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 57 #low a	 #chord 3
  	li $a1, 500 
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 654
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 57 #low a	 #chord 3
  	li $a1, 500 
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 654
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 55 #low G	 #chord 1
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 500
  	li $a2, 1
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 64
  	li $a2, 500
 	li $a3, 127
 	la $v0, 33
  	syscall
  	beq $s0, 0, decoy3	#JUMP BACK TO PROMPT
  	beq $s0, 1, decoy3.2
  	
  	runaway:			######RUNAWAY
  	li $a0, 91 #High G     
  	li $a1, 1000
  	li $a2, 1
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 91 #High G     
  	li $a1, 1000
  	li $a2, 1
 	li $a3, 127
 	la $v0, 33
 	syscall 
  	li $a0, 91
  	li $a1, 1000
  	li $a2, 1
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 76
  	li $a2, 1000
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 86
  	li $a1, 1000
  	li $a2, 1
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 86
  	li $a1, 1000
  	li $a2, 1
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 86
  	li $a1, 1000
  	li $a2, 1
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 74
  	li $a1, 1000
  	li $a2, 1
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 84
  	li $a1, 1000
  	li $a2, 1
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 84
  	li $a1, 1000
  	li $a2, 1
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 84
  	li $a1, 1000
  	li $a2, 1
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 72
  	li $a1, 1000
  	li $a2, 1
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 81
  	li $a1, 1000
  	li $a2, 1
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 81
  	li $a1, 1000
  	li $a2, 1
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 79
  	li $a1, 1000
  	li $a2, 1
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 91
  	li $a1, 1000
  	li $a2, 1
 	li $a3, 127
 	la $v0, 33
  	syscall
  	beq $s0, 0, decoy1	#JUMP BACK TO PROMPT
  	beq $s0, 1, decoy1.2
  	
  	thinkin:		######THINKIN BOUT YOU
  	li $a0, 64
  	li $a1, 1500
  	li $a2, 43
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 64
  	li $a1, 1505
  	li $a2, 43
 	li $a3, 100
 	la $v0, 33
  	syscall
  	li $a0, 60
  	li $a1, 1500
  	li $a2, 43
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 1505
  	li $a2, 43
 	li $a3, 100
 	la $v0, 33
  	syscall
  	li $a0, 62
  	li $a1, 1500
  	li $a2, 43
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 62
  	li $a1, 1505
  	li $a2, 43
 	li $a3, 100
 	la $v0, 33
  	syscall
  	li $a0, 60
  	li $a1, 1500
  	li $a2, 43
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 60
  	li $a1, 1505
  	li $a2, 43
 	li $a3, 100
 	la $v0, 33
  	syscall
  	beq $s0, 0, decoy2	#JUMP BACK TO PRIMPT
  	beq $s0, 1, decoy2.2  	
  	
  	virgin:		######LIKE A VIRGIN
	li $a0, 41
  	li $a1, 200
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 41
  	li $a1, 200
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 38
  	li $a1, 200
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 38
  	li $a1, 200
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 33
 	syscall
  	li $a0, 36
  	li $a1, 200 
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 36
  	li $a1, 200 
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 41
  	li $a1, 200
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 41
  	li $a1, 200 
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 41
  	li $a1, 200 
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 41
  	li $a1, 200 
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 38
  	li $a1, 200
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 38
  	li $a1, 200
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 33
  	syscall 
  	li $a0, 36
  	li $a1, 200 
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 36
  	li $a1, 200
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 38
  	li $a1, 200 
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 38
  	li $a1, 200 
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 41
  	li $a1, 200
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 41
  	li $a1, 200
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 38
  	li $a1, 200
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 38
  	li $a1, 200
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 33
 	syscall
  	li $a0, 36
  	li $a1, 200 
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 36
  	li $a1, 200 
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 41
  	li $a1, 200
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 41
  	li $a1, 200 
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 41
  	li $a1, 200 
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 41
  	li $a1, 200 
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 38
  	li $a1, 200
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 38
  	li $a1, 200
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 33
  	syscall 
  	li $a0, 36
  	li $a1, 200 
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 36
  	li $a1, 200
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 38
  	li $a1, 200 
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 38
  	li $a1, 200 
  	li $a2, 6#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	beq $s0, 0, decoy1C	#JUMP BACK TO PRIMPT
  	beq $s0, 1, decoy1C.2
  	
  	belong:		######## WE BELONG TOGETHER
  	li $a0, 69
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 81
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 33
  	syscall 
  	li $a0, 71
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 83
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 72
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 84
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 33
  	syscall 
  	li $a0, 74
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 86
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 88
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 84
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 81
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 76
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 84
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 81
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 88
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 84
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 81
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 76
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 86
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 83
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 78
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 74
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 83
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 78
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 86
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 83
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 78
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 74
  	li $a1, 250 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 84
  	li $a1, 300
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 81
  	li $a1, 300 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 77
  	li $a1, 300 
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 31
  	syscall
  	li $a0, 72
  	li $a1, 300
  	li $a2, 1#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	beq $s0, 0, decoy2C	#JUMP BACK TO PRIMPT
  	beq $s0, 1, decoy2C.2
  	
  	lovegalore:
  	li $a0, 57
  	li $a1, 600
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 52
  	li $a1, 600 
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 41
  	li $a1, 500 
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 57
  	li $a1, 600
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 52
  	li $a1, 600 
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 41
  	li $a1, 500 
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 57
  	li $a1, 600
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 52
  	li $a1, 600 
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 41
  	li $a1, 500 
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 57
  	li $a1, 600
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 52
  	li $a1, 600 
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 41
  	li $a1, 500 
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall	
  	li $a0, 52
  	li $a1, 600
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 47
  	li $a1, 600
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 36
  	li $a1, 500 
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 52
  	li $a1, 600
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 47
  	li $a1, 600
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 36
  	li $a1, 500 
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 52
  	li $a1, 600
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 47
  	li $a1, 600
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 36
  	li $a1, 500 
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 52
  	li $a1, 600
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 47
  	li $a1, 600
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 36
  	li $a1, 500 
  	li $a2, 63#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	beq $s0, 0, decoy3H	#JUMP BACK TO PRIMPT
  	beq $s0, 1, decoy3H.2
  	
  	letsstay:
  	li $v0, 4
	la $a0, sorry
	syscall
	li $v0, 4 
	la $a0, return
	beq $s0, 0, decoy4	#JUMP BACK TO PRIMPT
  	beq $s0, 1, decoy4.2
  	
  	starboy:
  	li $v0, 4
	la $a0, sorry
	syscall
	li $v0, 4 
	la $a0, return
	beq $s0, 0, decoy4H	#JUMP BACK TO PRIMPT
  	beq $s0, 1, decoy4H.2
  	
  	redbone:
  	li $a0, 70
  	li $a1, 300
  	li $a2, 32#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 68
  	li $a1, 300
  	li $a2, 32#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 66
  	li $a1, 300
  	li $a2, 32#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 65
  	li $a1, 300
  	li $a2, 32#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 61
  	li $a1, 300
  	li $a2, 32#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 58
  	li $a1, 300
  	li $a2, 32#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 63
  	li $a1, 600
  	li $a2, 32#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 61
  	li $a1, 300
  	li $a2, 32#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 63
  	li $a1, 300
  	li $a2, 32#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 66
  	li $a1, 300
  	li $a2, 32#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 73
  	li $a1, 300
  	li $a2, 32#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 70
  	li $a1, 600
  	li $a2, 32#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 65
  	li $a1, 300
  	li $a2, 32#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 66
  	li $a1, 300
  	li $a2, 32#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 68
  	li $a1, 300
  	li $a2, 32#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	li $a0, 66
  	li $a1, 650
  	li $a2, 32#
 	li $a3, 127
 	la $v0, 33
  	syscall
  	beq $s0, 0, decoy2H	#JUMP BACK TO PRIMPT
  	beq $s0, 1, decoy2H.2
  	
  	scrubs:
  	li $v0, 4
	la $a0, sorry
	syscall
	li $v0, 4 
	la $a0, return
	beq $s0, 0, decoy3C	#JUMP BACK TO PRIMPT
  	beq $s0, 1, decoy3C.2
  	
  	dani:
  	li $v0, 4
	la $a0, sorry
	syscall
	li $v0, 4 
	la $a0, return
	beq $s0, 0, decoy4C	#JUMP BACK TO PRIMPT
  	beq $s0, 1, decoy4C.2
  	
  	bbhmm:
  	li $v0, 4
	la $a0, sorry
	syscall
	li $v0, 4 
	la $a0, return
	beq $s0, 0, decoy1H	#JUMP BACK TO PRIMPT
  	beq $s0, 1, decoy1H.2
  	
  	
  	
  	
  	

	
