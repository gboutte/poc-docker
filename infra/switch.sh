#!/bin/sh

live=$(docker exec bg current-live)
if [ $live = "blue" ]
then
  beta="green"
else
  beta="blue"
fi
read -p "Switch $beta to production ? (N/y)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Switching $beta to production."
  docker exec bg switch $beta
else
  echo "Aborting."
fi
