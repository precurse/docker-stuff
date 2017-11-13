set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=precurse
# image name
IMAGE=syncthing-relay
VERSION=`cat VERSION`

docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$VERSION
