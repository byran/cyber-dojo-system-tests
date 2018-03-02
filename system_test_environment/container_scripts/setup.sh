#!/bin/sh

# Install packages need to build the gems
apk --update --no-cache add build-base libffi-dev

gem install selenium-webdriver -N
gem install minitest -N
gem install json -N

# Remove packages to keep the image small
apk del build-base libffi-dev