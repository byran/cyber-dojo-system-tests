#!/bin/bash

docker run -t --rm \
-e "browser=chrome" \
-e "SCREEN_WIDTH=1920" \
-e "SCREEN_HEIGHT=1080" \
-v `pwd`/tests:/tests cyberdojo/seleniumbase
