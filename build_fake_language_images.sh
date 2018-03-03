#!/bin/bash

# To shorten the build time on Travis I'm creating fake images
# for languageFramework images that would otherwise be pulled
# by the [cyber-dojo up] command but are not used.

# TODO: get these from the
# $ cyber-dojo start-point inspect custom
# command

docker tag alpine:latest cyberdojofoundation/python_unittest
docker tag alpine:latest cyberdojofoundation/csharp_nunit
docker tag alpine:latest cyberdojofoundation/gpp_assert
docker tag alpine:latest cyberdojofoundation/java_junit
docker tag alpine:latest cyberdojofoundation/ruby_test_unit
