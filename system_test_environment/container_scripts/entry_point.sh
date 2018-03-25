#!/bin/bash

cd /tests
cucumber 2>&1 | tee features/artifacts/`date +%Y-%m-%d-%H-%M-%S`-log.txt ; test ${PIPESTATUS[0]} -eq 0
