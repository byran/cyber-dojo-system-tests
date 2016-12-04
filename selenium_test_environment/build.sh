#!/bin/bash

docker rmi cyberdojo/selenium-test-environment
docker build --no-cache -t cyberdojo/selenium-test-environment .

