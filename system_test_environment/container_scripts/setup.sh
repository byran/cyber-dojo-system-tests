#!/bin/sh
set -e

# install packages need to build the gems and bash
apk --update --no-cache add build-base libffi-dev bash
# make it the default shell for root user
sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

gem install selenium-webdriver -v 3.0.1
gem install minitest -v 5.8.4
gem install cucumber -v 2.4.0
gem install simplecov -v 0.15.0

# remove packages to keep the image small
apk del build-base libffi-dev