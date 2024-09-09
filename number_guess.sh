#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"
#generate random number
NUMBER=$(( RANDOM % 1000 + 1 ))
#Ask user's name
echo Enter your username:
read USERNAME
#Check if user has played before
read USER_ID GAMES_PLAYED BEST_GAME <<< $(echo $($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username = '$USERNAME';") | sed 's/ *//g; s/|/ /g')
#if it has not played before
if [[ ! $USER_ID ]]
then
  #then register user
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
  #welcome new user
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  #welcome user and display scores
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
#Update number of games played
((GAMES_PLAYED++))
#Start guess counter
NUMBER_OF_GUESSES=1;
START(){
  #Check if it is the first time playing
  if [[ ! $1 ]]
  then
    echo -e "\nGuess the secret number between 1 and 1000:"
  else
    echo -e "\n$1"
    #increase number of guesses
    ((NUMBER_OF_GUESSES++))
  fi
  #Read user guess
  read GUESS
  #Check if input is a number
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    #if it is not a number print remark and ask for the user's guess again
    START "That is not an integer, guess again:"
  else
    #if it is, then check if the guess is correct (*)
    if [[ $GUESS != $NUMBER ]]
    then
      #if it doesn't match check if the gues is larger than the secret
      if [[ $GUESS -gt $NUMBER ]]
      then
        #if so print secret number is lower
        START "It's lower than that, guess again:"
      else
        #otherwise print secret number is lower
        START "It's higher than that, guess again:"
      fi
    else
      #if it matches then
      #check if the user has played before and if the number of guesses is higher than their best
      if [[ $BEST_GAME && $NUMBER_OF_GUESSES -gt $BEST_GAME ]]
      then
        #if so update only the number of games played
        UPDATE_RECORD=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE username = '$USERNAME';")
      else
        #otherwise update both number of games played and the best score
        UPDATE_RECORD=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED, best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME';")
      fi
      #print message and exit
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!"
    fi
  fi
}
#Start game
START

