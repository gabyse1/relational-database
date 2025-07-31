#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ ! $1 ]]
then
  echo "Please provide an element as an argument."
else
  ELEMENT=$1
  if [[ $ELEMENT =~ ^[0-9]+$ ]]
  then
    SELECT_ELEMENT_RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$ELEMENT;")
  else
    SELECT_ELEMENT_RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$ELEMENT' OR name='$ELEMENT';")
  fi

  if [[ -z $SELECT_ELEMENT_RESULT ]]
  then
    echo "I could not find that element in the database."
  else
    IFS='|' read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING BOILING <<< "$SELECT_ELEMENT_RESULT"
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  fi
fi

# DELETE ELEMENT
DELETE_PROPERTIE_RESULT=$($PSQL "DELETE FROM properties WHERE atomic_number=1000")
if [[ $DELETE_PROPERTIE_RESULT == "DELETE 1" ]]
then
  DELETE_ELEMENT_RESULT=$($PSQL "DELETE FROM elements WHERE atomic_number=1000")
fi

# DROP TYPE COLUMN FROM PROPERTIES TABLE
DROP_TYPE_COLUMN=$($PSQL "ALTER TABLE properties DROP COLUMN IF EXISTS type;")