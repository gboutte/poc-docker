#!/bin/sh

live=$(docker exec loadbalancer current-live)
if [ $live = "blue" ]
then
  beta="green"
else
  beta="blue"
fi
echo
echo "Current live container: $live"
echo "Current beta container: $beta"

echo

echo "REBUILD BETA: $beta"
container_name="${beta}_app"
#docker compose -p appbg up -d --build blue_app
read -p "Re-Build $beta? (N/y)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Building $beta."
  docker compose -p appbg up -d --build $container_name
else
  echo "Aborting."
fi