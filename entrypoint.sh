#!/bin/bash

cd /app
touch .env

if [[ ! -f $DATABASE_FILE ]]
then
  echo "Initialising database"
  touch $DATABASE_FILE
  ./lancache-autofill app:initialise-database
fi

exec "$@"