#!/bin/bash

docker rmi cyberdojo/system-tests
docker build --no-cache -t cyberdojo/system-tests .
