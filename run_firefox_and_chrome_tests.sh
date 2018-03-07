#!/bin/bash
set -e

# - - - - - - - - - - - - - - - - - - - - - -

bring_up_selenium_hub_and_nodes()
{
  docker-compose \
    --file=cyber_dojo_selenium/docker-compose.yml \
    up \
    -d \
    --scale node_participant_chrome=3 \
    --scale node_participant_firefox=3
}

# - - - - - - - - - - - - - - - - - - - - - -

wait_for_nodes_to_connect_to_the_hub()
{
  sleep 5
}

# - - - - - - - - - - - - - - - - - - - - - -

run_tests_on()
{
  docker run \
    --env "browser=$1" \
    --tty \
    --rm \
    --network cyberdojoselenium_default \
    --volume `pwd`/features/artifacts:/features/artifacts \
    cyberdojo/system-tests
}

# - - - - - - - - - - - - - - - - - - - - - -

take_down_the_selenium_hub_and_nodes()
{
  docker-compose \
    --file=cyber_dojo_selenium/docker-compose.yml \
    down
}


# - - - - - - - - - - - - - - - - - - - - - -

trap take_down_the_selenium_hub_and_nodes INT EXIT

bring_up_selenium_hub_and_nodes
wait_for_nodes_to_connect_to_the_hub
run_tests_on chrome
CHROME_RESULT=$?
run_tests_on firefox
FIREFOX_RESULT=$?

if [ "$CHROME_RESULT" -ne "0" ]; then
    exit $CHROME_RESULT
fi

if [ "$FIREFOX_RESULT" -ne "0" ]; then
    exit $FIREFOX_RESULT
fi

exit 0
