#!/bin/sh
set -e

# install packages need to build the gems
apk --update --no-cache add build-base libffi-dev
# install bash
apk --update --no-cache add bash
# make it the default shell for root user
sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

bundler install

# remove packages to keep the image small
apk del build-base libffi-dev