#!/bin/sh

read -p "Start developpement ? (N/y)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Starting..."
  docker compose -p appbg -f docker-compose.yml -f docker-compose.dev.yml up --build
else
  echo "Aborting."
fi
