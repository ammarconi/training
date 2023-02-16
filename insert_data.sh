#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "truncate table games, teams")

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WIN_GOALS OPP_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    # get team id
    WIN_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    OPP_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    # if not found insert new
    if [[ -z $WIN_ID ]]
    then
      # add team id
      INSERT_TEAM=$($PSQL "insert into teams(name) values('$WINNER')")
      # get new team id
      WIN_ID=$($PSQL "select team_id from teams where name='$WINNER'") 
      echo "INS (W) $WINNER ($INSERT_TEAM) ID:$WIN_ID"
    fi
    if [[ -z $OPP_ID ]]
    then
      INSERT_TEAM=$($PSQL "insert into teams(name) values('$OPPONENT')")
      OPP_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
      echo "INS (O) $OPPONENT ($INSERT_TEAM) ID:$OPP_ID"
    fi
    # insert data 
    INSERT_GAME=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $WIN_ID, $OPP_ID, $WIN_GOALS, $OPP_GOALS)")
    if [[ $INSERT_GAME == "INSERT 0 1" ]]
    then
      echo INSERTED $YEAR $ROUND
    fi
  fi
done
