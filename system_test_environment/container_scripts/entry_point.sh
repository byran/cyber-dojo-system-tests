#!/bin/bash

cd /tests
cucumber -r features -f pretty 2>&1 | tee artifacts/`date +%Y-%m-%d-%H-%M-%S`-log.txt ; test ${PIPESTATUS[0]} -eq 0
