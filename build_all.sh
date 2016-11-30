#!/bin/bash

cd $(dirname $0)

# Build the base docker image
cd SeleniumBase/
./build.sh

# Build the selenium tests docker image
cd ../SeleniumTests/
./build.sh

