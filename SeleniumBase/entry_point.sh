#!/bin/bash

source /opt/bin/functions.sh

export GEOMETRY="$SCREEN_WIDTH""x""$SCREEN_HEIGHT""x""$SCREEN_DEPTH"

function shutdown {
  kill -s SIGTERM $TESTS_PID
  wait $TESTS_PID
}

SERVERNUM=$(get_server_num)

rm -f /tmp/.X*lock

cd /tests

xvfb-run -n $SERVERNUM --server-args="-screen 0 $GEOMETRY -ac +extension RANDR" \
  ruby all_tests.rb &
TESTS_PID=$!

trap shutdown SIGTERM SIGINT
wait $TESTS_PID
