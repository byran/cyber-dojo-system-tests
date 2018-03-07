#!/bin/sh
set -e

# install packages need to build the gems and bash
apk --update --no-cache add build-base libffi-dev bash
# make it the default shell for root user
sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

gem install selenium-webdriver
gem install minitest
gem install cucumber
gem install simplecov

# remove packages to keep the image small
apk del build-base libffi-dev