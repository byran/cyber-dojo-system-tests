#!/bin/bash

docker rmi cyberdojo/seleniumbase
docker build -t cyberdojo/seleniumbase .
