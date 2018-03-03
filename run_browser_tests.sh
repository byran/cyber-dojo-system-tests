#!/bin/bash

# Bring up selenium hub and nodes
docker-compose \
  --file=cyber_dojo_selenium/docker-compose.yml \
  up \
  -d

# Wait for nodes to connect to the hub
sleep 5

# Run the tests
docker run \
  --env "browser=${1}" \
  --tty \
  --rm \
  --network cyberdojoselenium_default \
  --volume `pwd`/tests:/tests \
  cyberdojo/system-test-environment

RESULT=$?

# Take down the selenium hub and nodes
docker-compose \
  --file=cyber_dojo_selenium/docker-compose.yml \
  down

exit $RESULT
