#!/bin/bash

docker rmi cyberdojo/selenium-test-environment
docker build -t cyberdojo/selenium-test-environment .

