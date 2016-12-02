#!/bin/bash

# Create a custom docker network and bring up selenium hub and nodes
docker network create cyber_dojo_system_tests
docker-compose up -d

# Wait for nodes to connect to the hub
sleep 1

# Run the tests
docker run -t --rm --network cyber_dojo_system_tests -e "browser=chrome" -v `pwd`/tests:/tests cyberdojo/selenium-test-environment

# Take down the selenium hub, nodes and the docker network
docker-compose down
docker network rm cyber_dojo_system_tests
