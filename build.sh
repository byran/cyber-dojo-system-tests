#!/bin/bash

docker rmi cyberdojo/system-tests
docker build -t cyberdojo/system-tests .
