#!/bin/bash

docker-compose up -d
# TODO: Figure out where the network name 'cyberdojosystemtests_default' comes from
# I assume it's the directory name but this will need to be fixed
docker run -t --rm --network cyberdojosystemtests_default -e "browser=chrome" -v `pwd`/tests:/tests cyberdojo/selenium-test-environment
docker-compose down
