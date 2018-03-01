#!/bin/bash

docker rmi cyberdojo/system-tests 2> /dev/null
docker build --no-cache --tag cyberdojo/system-tests .
