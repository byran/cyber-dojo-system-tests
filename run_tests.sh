#!/bin/bash

# Bring up selenium hub and nodes
docker-compose --file=cyber_dojo_selenium/docker-compose.yml up -d

# Wait for nodes to connect to the hub
sleep 5

# Run the tests
docker run -e "browser=chrome" -t --rm --network cyberdojoselenium_default -v `pwd`/tests/artifacts:/tests/artifacts cyberdojo/system-tests
CHROME_RESULT=$?

docker run -e "browser=firefox" -t --rm --network cyberdojoselenium_default -v `pwd`/tests/artifacts:/tests/artifacts cyberdojo/system-tests
FIREFOX_RESULT=$?

# Take down the selenium hub and nodes
docker-compose --file=cyber_dojo_selenium/docker-compose.yml down

if [[ "$CHROME_RESULT" -eq "0" && "$FIREFOX_RESULT" -eq "0" ]]; then
    exit 0
fi

if [ "$CHROME_RESULT" -ne "0" ]; then
    exit $CHROME_RESULT
fi

if [ "$FIREFOX_RESULT" -ne "0" ]; then
    exit $FIREFOX_RESULT
fi

# Should never get here but just in case
exit 1
