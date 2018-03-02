#!/bin/sh

cd /tests
ruby all_tests.rb 2>&1 | tee artifacts/`date +%Y-%m-%d-%H-%M-%S`-log.txt ; test ${PIPESTATUS[0]} -eq 0
