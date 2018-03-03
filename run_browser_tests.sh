#!/bin/bash
set -e

# $1 == [chrome|firefox]

# - - - - - - - - - - - - - - - - - -

bring_up_selenium_hub_and_nodes()
{
  docker-compose \
  --file=cyber_dojo_selenium/docker-compose.yml \
  up \
  -d \
  node_${1}
}

# - - - - - - - - - - - - - - - - - -

wait_for_nodes_to_connect_to_the_hub()
{
  sleep 5
}

# - - - - - - - - - - - - - - - - - -

run_tests_for()
{
  docker run \
    --env "browser=${1}" \
    --tty \
    --rm \
    --network cyberdojoselenium_default \
    --volume `pwd`/tests:/tests \
    cyberdojo/system-test-environment
}

# - - - - - - - - - - - - - - - - - -

take_down_the_selenium_hub_and_nodes()
{
  docker-compose \
    --file=cyber_dojo_selenium/docker-compose.yml \
    down
}

# - - - - - - - - - - - - - - - - - -

trap take_down_the_selenium_hub_and_nodes INT EXIT

bring_up_selenium_hub_and_nodes $1
wait_for_nodes_to_connect_to_the_hub
run_tests_for $1
RESULT=$?
exit $RESULT

