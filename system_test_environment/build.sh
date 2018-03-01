#!/bin/bash

docker rmi cyberdojo/system-test-environment 2> /dev/null
docker build --no-cache --tag cyberdojo/system-test-environment .
