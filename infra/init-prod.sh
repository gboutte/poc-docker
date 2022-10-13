#!/bin/sh
i=$(docker ps | grep appbg | wc -l)
echo $i

if [ $i -gt 0 ]
then
 echo "Curretly $i appbg dockers running"
fi

read -p "Init prod ? (N/y)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Starting..."
  docker compose -p appbg -f docker-compose.yml up --build -d
else
  echo "Aborting."
fi
