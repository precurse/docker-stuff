#!/bin/bash
set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=precurse
# image name
IMAGE=alpine-armhf
VERSION=`cat VERSION`

curl -L https://nl.alpinelinux.org/alpine/v${VERSION:0:3}/releases/armhf/alpine-minirootfs-${VERSION}-armhf.tar.gz -o rootfs.tar.gz

docker build -t $USERNAME/$IMAGE:latest .

docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$VERSION
