#!/bin/bash

echo "Building commander"
git clone https://github.com/cyber-dojo/commander.git
cd commander
git checkout new-ux-setup
./sh/build_docker_images.sh
cd ..

echo "Building starter"
git clone https://github.com/cyber-dojo/starter.git
cd starter
git checkout api-for-new-web-ux
./sh/build_docker_images.sh
cd ..

echo "Building #web"
git clone https://github.com/cyber-dojo/web.git
cd web
git checkout new-ux-setup
./sh/build_docker_image.sh
cd ..
