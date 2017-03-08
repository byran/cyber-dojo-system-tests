
If you're a developer wanting to build your own cyber-dojo server from source [start here](https://github.com/cyber-dojo/cyber-dojo/tree/master/dev).

[![Build Status](https://travis-ci.org/cyber-dojo/system-tests.svg?branch=master)](https://travis-ci.org/cyber-dojo/system-tests)

# Selenium system tests for cyber-dojo.org

TODO: write some more instructions :)

Tests are stores in the ```/tests``` directory

## Building the cyberdojo/system-tests docker image

```
./build.sh
```

## Running the tests

```
cyber-dojo up
./run_tests.sh
cyber-dojo down
```
This will run the tests against both Chrome and Firefox
