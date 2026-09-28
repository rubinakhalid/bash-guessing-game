#!/bin/bash

echo "Welcome to Bash Number Guessing Game!"

games_played=0
games_won=0
play_again="yes"

while [ "$play_again" = "yes" ]; do

    number=$((RANDOM % 50 + 1))
    max_attempts=7
    attempts=0
    won=0
    games_played=$((games_played + 1))

    echo "Think of a number between 1 and 50."
    echo "You have 7 attempts to guess it."

    while [ $attempts -lt $max_attempts ]; do

        echo -n "Enter your guess: "
        read guess

        attempts=$((attempts + 1))

        if [ $guess -lt 1 ] || [ $guess -gt 50 ]; then
            echo "Invalid input! Please enter a number between 1 and 50."

        elif [ $guess -lt $number ]; then
            echo "Too low! Try a higher number."

        elif [ $guess -gt $number ]; then
            echo "Too high! Try a lower number."

        else
            echo "Congratulations! You guessed the number $number in $attempts attempts!"
            games_won=$((games_won + 1))
            won=1
            break
        fi

        remaining=$((max_attempts - attempts))

        if [ $remaining -gt 0 ]; then
            echo "Attempts remaining: $remaining"
        fi

    done

    if [ $won -eq 0 ]; then
        echo "Game Over! The number was $number. Better luck next time!"
    fi

    echo -n "Would you like to play again? (yes/no): "
    read play_again

done

echo "Thanks for playing!"
echo "Games played: $games_played"
echo "Games won: $games_won"
