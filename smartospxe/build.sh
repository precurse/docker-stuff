set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=precurse
# image name
IMAGE=smartospxe
VERSION=`cat VERSION`

if `uname -m | grep armv7l`; then
  BASE_IMAGE="precurse/alpine-armhf:3.6.2"
  docker build --build-arg BASE_IMAGE=${BASE_IMAGE} -t $USERNAME/$IMAGE:latest .
  docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$VERSION
else
  docker build -t $USERNAME/$IMAGE:latest .
  docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$VERSION
fi

