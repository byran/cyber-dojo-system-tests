#!/bin/bash

cd /tests
ruby all_tests.rb 2>&1 | tee artifacts/log-`date +%Y-%m-%d-%H-%M-%S`.txt ; test ${PIPESTATUS[0]} -eq 0
