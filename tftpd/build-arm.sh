set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=precurse
# image name
IMAGE=tftpd
VERSION=`cat VERSION`
BASE_IMAGE="precurse/alpine-armhf:3.6.2"

docker build --build-arg BASE_IMAGE=${BASE_IMAGE} -t $USERNAME/$IMAGE:latest .
docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$VERSION

