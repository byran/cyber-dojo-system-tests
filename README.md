# Selenium system tests for cyber-dojo.org

TODO: write some more instructions :)

Tests are stores in the ```/tests``` directory

## Building the docker images

```
./build_all.sh
```

## Running the tests

### To run tests using Google Chrome

```
cyber-dojo up
./run_tests.sh
cyber-dojo down
```

### To run tests using Firefox

Currently you have to modify the run_tests.sh and add ```-e "browser=firefox"``` to the docker run

