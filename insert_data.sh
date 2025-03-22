#!/bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Truncate tables to reset data (for testing purposes)
$($PSQL "TRUNCATE TABLE games, teams CASCADE")

# Read CSV file and insert data
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Skip header row
  if [[ $YEAR != "year" ]]
  then
    # Insert unique teams into the teams table
    TEAM_NAME="$WINNER"
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$TEAM_NAME'")
    if [[ -z $TEAM_ID ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$TEAM_NAME')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted team: $TEAM_NAME"
      fi
    fi

    TEAM_NAME="$OPPONENT"
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$TEAM_NAME'")
    if [[ -z $TEAM_ID ]]
    then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$TEAM_NAME')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted team: $TEAM_NAME"
      fi
    fi

    # Get team IDs for winner and opponent
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

    # Insert game data
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted game: $YEAR, $ROUND, $WINNER vs $OPPONENT"
    fi
  fi
done
