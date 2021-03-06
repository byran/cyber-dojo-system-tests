#!/bin/bash

# To shorten the build time on Travis I'm creating fake images
# for languageFramework images that would otherwise be pulled
# by the [cyber-dojo up] command.

# $1 == name of cyber-dojo start-point

images=(`./cyber-dojo start-point inspect $1 | tail -n +2 | awk '{ print $(NF-1) }' | sort | uniq`)

for image in "${images[@]}"
do
  echo "Creating fake image for ${image}"
  docker tag alpine:latest $image
done

