# Assignment 3 Code Review - Alanna's Code 

# My code reviewing comments will all start with my initials "SA:"

# Alanna Olteanu

# SA: Added these two lines for me to download her word text file
library(readr)
file_path <- "~~/Desktop/GitHub/Assignment-3-Code-Review/wordlist.txt"
# Reading the word list from the file
word_list <- readLines("wordlist.txt")

# Checking if the word list is empty
if (length(word_list) == 0) {
  stop("Word list is empty. Please populate the 'word_list.txt' file with words.")
}

# Choosing a random word from the list
secret_word <- sample(word_list, 1)

# Counting the number of characters in the secret word
word_length <- nchar(secret_word)

# Setting the number of maximum wrong guesses
max_wrong_guesses <- 6

# Initializing variables
guessed_letters <- character(0)
wrong_guesses <- 0

# Displaying initial information to the user
cat("Welcome to Hangman!\n")
cat("The category is: Wild Cats\n")
cat("The secret word has", word_length, "letters.\n")

# Creating the game loop
while (TRUE) {
  # Ask for user input
  guess <- readline("Enter a letter or the full word: ")
  
  # Validating user input
  if (!(nchar(guess) == 1 || nchar(guess) == word_length)) {
    cat("Invalid input. Please enter a single letter or the full word.\n")
    next
  }
  
  # Converting the guess to lowercase
  guess <- tolower(guess)
  
  # Checking if the guess is a single letter or the full word
  if (nchar(guess) == 1) {
    # Checking if the letter has already been guessed
    if (guess %in% guessed_letters) {
      cat("You have already guessed that letter. Try again.\n")
      next
    }
    
    # Adding the guessed letter to the list
    guessed_letters <- c(guessed_letters, guess)
    
    # Checking if the guessed letter is in the secret word
    if (grepl(guess, secret_word)) {
      cat("Correct guess!\n")
    } else {
      cat("Wrong guess!\n")
      wrong_guesses <- wrong_guesses + 1
    }
  } else {
    # Checking if the full word guess is correct
    if (guess == secret_word) {
      cat("Congratulations! You guessed the word correctly.\n")
      break
    } else {
      cat("Wrong guess!\n")
      wrong_guesses <- wrong_guesses + 1
    }
  }
  
  # Displaying the current state of the secret word
  current_state <- gsub(paste0("[^", paste(guessed_letters, collapse = ""), " ]"), "_", secret_word)
  cat("Current state:", current_state, "\n")
  
  # Checking if the user has won or lost
  if (all(strsplit(current_state, "")[[1]] == strsplit(secret_word, "")[[1]])) {
    cat("Congratulations! You guessed the word correctly.\n")
    break
  } else if (wrong_guesses == max_wrong_guesses) {
    cat("Sorry, you lost. The secret word was:", secret_word, "\n")
    break
  }
  
  # Displaying remaining tries
  remaining_tries <- max_wrong_guesses - wrong_guesses
  cat("Remaining tries:", remaining_tries, "\n")
}

# End of the game

#SA: Assignment Guidelines
# They successfully created and scanned a word list into their code to enable the user to guess words from a selected list  
# They successfully ensured that a random word is chosen each time the game is generated using the 'sample' function
# They successfully made the user aware of the number of letters found in the mystery word using the 'nchar' function, allowed the user to know how many guesses are allowed (6), and successfully aksed for user input
# They successfully ensured that the user can input both lowercase and uppercase letters using the 'tolower' function
# Game runs successfully through and ends - is not thrown into an infinite loop
# User is notified about the correct letters (visually depicted) and remaining tries

#SA: Suggestions for Improvement 
# When the user inputs the incorrect word the number of remaining tries does not go down so the user can guess as many words incorrectly without any penalty 
    # The user will also not be notified about which words they have already typed and may continuously type the same word without being prompted for novel input
# Additionally, if the user puts input of a string of letters of numbers that matches the same numbers as the mystery word an attempt will be used
    # i.e. if the mystery word has 6 letters and the user inputs "98lk98" an attempt will go missing and the game will not show that this is an invalid input
# The game also accepts single numbers as inputs and recognizes them as letters - would be helpful if the user was notified that their input was invalid and was only able to input letters
# Would be nice if there was a visual tally of the user's guesses to help them remember previous attempts instead of just receiving the error message that they've guessed that letter

#SA: Overall Opinion
# Followed assignment guidelines effectively 
# Code utilizes different functions such as the 'cat' function to allow for the concatenation and printing of multiple arguments together 
# Code was easy to understand and follow - great comments to ensure the user knows what each line is generating 
    # Concise and effective 
# Only a few minor alterations could be made outlined in the suggestions for improvement 
# GREAT JOB ALANNA