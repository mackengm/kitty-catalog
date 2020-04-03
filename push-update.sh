#!/bin/bash
current=`git symbolic-ref --short -q HEAD`
git checkout ${current}

# Compile the site before copying to the new image.
hugo --ignoreCache --ignoreVendor --minify --debug --verbose --baseURL=https://catalog.m4ck3ngm.com
echo "Kitty-Catalog Hugo compilation is complete."
echo "Starting docker image build..."
docker image build -f push-update-Dockerfile --no-cache -t kitty-catalog .
echo "docker image build is complete."
docker login
docker tag kitty-catalog m4ck3ngm/kitty-catalog:latest
docker push m4ck3ngm/kitty-catalog:latest
