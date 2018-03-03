#!/bin/sh

# install packages need to build the gems
apk --update --no-cache add build-base libffi-dev
# install bash
apk --update --no-cache add bash
# make it the default shell for root user
sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

gem install selenium-webdriver -N
gem install minitest -N
gem install json -N

# Remove packages to keep the image small
apk del build-base libffi-dev