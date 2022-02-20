#!/bin/bash

cd /app
touch .env
[ -s /app/database.sqlite ] || ./lancache-autofill app:initialise-database
#./lancache-autofill app:initialise-downloads-directory

exec "$@"