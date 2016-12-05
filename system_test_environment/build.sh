#!/bin/bash

docker rmi cyberdojo/system-test-environment
docker build --no-cache -t cyberdojo/system-test-environment .

