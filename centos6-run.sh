#!/bin/bash

if [[ ! -d "$(pwd)/mysql" ]]; then
  mkdir -p $(pwd)/mysql
fi

# Change these if you already have other services running on default ports
WEBPORT=80
VNCPORT=5901
DBPORT=3306

docker run -d -t \
  -v $(pwd)/emg/data:/emg/data \
  -v $(pwd)/mysql:/var/lib/mysql \
  -v $(pwd):/local_data \
  -w /sw/myami/appion \
  -p $WEBPORT:80 -p $VNCPORT:5901 -p $DBPORT:3306 \
  semc/appion-protomo

echo Waiting for database...
sleep 10
echo Done.
