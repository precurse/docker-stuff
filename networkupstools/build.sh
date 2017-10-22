set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=precurse
# image name
IMAGE=networkupstools
VERSION=`cat VERSION`

docker build -t $USERNAME/$IMAGE:latest .
docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$VERSION

