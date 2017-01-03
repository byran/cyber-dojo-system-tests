#!/bin/bash

cd /tests
ruby all_tests.rb 2>&1 | tee artifacts/log-`date +%Y-%m-%d-%H-%M-%S`.txt
