#!/bin/bash

# Bring up selenium hub and nodes
docker-compose --file=cyber_dojo_selenium/docker-compose.yml up -d

# Wait for nodes to connect to the hub
sleep 1

# Run the tests
docker run -t --rm --network cyberdojoselenium_default cyberdojo/system-tests
RESULT=$?

# Take down the selenium hub and nodes
docker-compose --file=cyber_dojo_selenium/docker-compose.yml down

exit $RESULT
