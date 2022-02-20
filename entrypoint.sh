#!/bin/bash

cd /app
touch .env
./lancache-autofill app:initialise-database
./lancache-autofill app:initialise-downloads-directory

tail -f /dev/null