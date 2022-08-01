set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=precurse
# image name
IMAGE=syncthing
VERSION=`cat VERSION`

if uname -m | grep armv7l; then
  BASE_IMAGE="precurse/alpine-armhf:latest"
  ARCH=arm
  podman build --build-arg BASE_IMAGE=${BASE_IMAGE} --build-arg ARCH=${ARCH} -t $USERNAME/$IMAGE:latest .
  podman tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$VERSION
else
  podman build -t $USERNAME/$IMAGE:latest .
  podman tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$VERSION
fi
