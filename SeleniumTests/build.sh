#!/bin/bash

docker rmi cyberdojo/seleniumtest
docker build -t cyberdojo/seleniumtest .
