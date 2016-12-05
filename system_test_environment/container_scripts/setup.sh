#!/bin/bash

apt-get update -qqy

apt-get -qqy --no-install-recommends install \
    build-essential \
    ruby \
    ruby-dev

rm -rf /var/lib/apt/lists/* /var/cache/apt/*

gem install selenium-webdriver
