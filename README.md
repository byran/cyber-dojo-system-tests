# Selenium system tests for cyber-dojo.org

TODO: write some more instructions :)

Tests are stores in the ```SeleniumTests/tests``` directory

## Building the docker images

```
./build_all.sh
```

## Running the tests

To run tests using Google Chrome

```
docker run -t --rm  cyberdojo/seleniumtest
```

To run tests using Firefox

```
docker run -t --rm -e "browser=firefox" cyberdojo/seleniumtest
```
