#!/bin/bash

PORT=5901

if [ "$1" == "firefox" ]; then
    PORT=5900
fi

sed 's/node-firefox/node-firefox-debug/; s/node-chrome/node-chrome-debug/' <docker-compose.yml >docker-compose-debug.yml

docker-compose --file=docker-compose-debug.yml up -d --scale node_participant_chrome=0 --scale node_participant_firefox=0
sleep 3
vnc 127.0.0.1:$PORT
docker-compose --file=docker-compose-debug.yml down

rm -f docker-compose-debug.yml
