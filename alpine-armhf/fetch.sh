#!/bin/bash
set -ex
VERSION=`cat VERSION`

curl -L https://nl.alpinelinux.org/alpine/v${VERSION:0:3}/releases/armhf/alpine-minirootfs-${VERSION}-armhf.tar.gz -o rootfs.tar.gz
