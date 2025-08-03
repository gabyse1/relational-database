#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read USERNAME
# while [[ ${#USERNAME} -ne 5 ]]
# do
#   echo -e "\n Your username must have 22 characters."
#   echo "Enter your username:"
#   read USERNAME
# done

# Welcome message to the user verifying whether the username is new or has been used before
EXISTING_USER=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username='$USERNAME';")
if [[ -z $EXISTING_USER ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  GAMES_PLAYED=0
  BEST_GAME=0
else
  IFS='|' read -r USERNAME_DB GAMES_PLAYED BEST_GAME <<< "$EXISTING_USER"
  echo "Welcome back, $USERNAME_DB! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate a random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Prompt to the user to enter their guessed number
echo "Guess the secret number between 1 and 1000:"
read GUESS_NUMBER

# Show hints to the user to guess the secret number
GAMES_COUNTER=0
while [[ $GUESS_NUMBER -ne $SECRET_NUMBER ]]
do
  # Validate that the user enters integer value
  while ! [[ $GUESS_NUMBER =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read GUESS_NUMBER
  done
  ((GAMES_COUNTER++))
  if [[ $GUESS_NUMBER -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    read GUESS_NUMBER
  elif [[ $GUESS_NUMBER -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    read GUESS_NUMBER
  fi
done
((GAMES_COUNTER++))
((GAMES_PLAYED++))

# Update user data in the database
if [[ $BEST_GAME -eq 0 || $GAMES_COUNTER -lt $BEST_GAME ]]
then
  BEST_GAME=$GAMES_COUNTER
fi
UPDATE_GAMEDATA=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME';")

# Display message when user guessed secret number
echo "You guessed it in $GAMES_COUNTER tries. The secret number was $SECRET_NUMBER. Nice job!"
