#!/bin/bash
if [ $# -eq 0 ]; then
  echo "Please provide an element as an argument."
  
else
  PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
  input="$1"
  #echo "this is input : $input"
  re='^[0-9]+$'
  if ! [[ $input =~ $re ]] ;then
    count1=`$PSQL "SELECT COUNT(atomic_number) FROM elements WHERE symbol = '$input' OR name = '$input';"`
    #echo "COUNT 1:::::::::::::::::::"
    if [ $count1 -lt 1 ]; then
      echo "I could not find that element in the database."
      
    else
    element_searched_id=`$PSQL "SELECT atomic_number FROM elements WHERE symbol = '$input' OR name = '$input';"`
    
    element_searched_symbol=`$PSQL "SELECT symbol FROM elements WHERE atomic_number = $element_searched_id;"`
    element_searched_name=`$PSQL "SELECT name FROM elements WHERE atomic_number = $element_searched_id;"`
    element_searched_type_id=`$PSQL "SELECT type_id FROM properties WHERE atomic_number = $element_searched_id;"`
    element_searched_type=`$PSQL "SELECT type FROM types WHERE type_id = $element_searched_type_id;"`
    element_searched_atomic_mass=`$PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $element_searched_id;"`
    element_searched_melting=`$PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $element_searched_id;"`
    element_searched_boiling=`$PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $element_searched_id;"`
    echo "The element with atomic number $element_searched_id is $element_searched_name ($element_searched_symbol). It's a $element_searched_type, with a mass of $element_searched_atomic_mass amu. $element_searched_name has a melting point of $element_searched_melting celsius and a boiling point of $element_searched_boiling celsius."
  
    fi

  else
    count2=`$PSQL "SELECT COUNT(atomic_number) FROM elements WHERE atomic_number = $input;"`
    #echo "COUNT2 ::::::::::::"
    if [ $count2 -lt 1 ]; then
      echo "I could not find that element in the database."
      
    else
    element_searched_id=`$PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $input;"`
    
    element_searched_symbol=`$PSQL "SELECT symbol FROM elements WHERE atomic_number = $element_searched_id;"`
    element_searched_name=`$PSQL "SELECT name FROM elements WHERE atomic_number = $element_searched_id;"`
    element_searched_type_id=`$PSQL "SELECT type_id FROM properties WHERE atomic_number = $element_searched_id;"`
    element_searched_type=`$PSQL "SELECT type FROM types WHERE type_id = $element_searched_type_id;"`
    element_searched_atomic_mass=`$PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $element_searched_id;"`
    element_searched_melting=`$PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $element_searched_id;"`
    element_searched_boiling=`$PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $element_searched_id;"`
    echo "The element with atomic number $element_searched_id is $element_searched_name ($element_searched_symbol). It's a $element_searched_type, with a mass of $element_searched_atomic_mass amu. $element_searched_name has a melting point of $element_searched_melting celsius and a boiling point of $element_searched_boiling celsius."
  
    fi

  fi
  
 
fi