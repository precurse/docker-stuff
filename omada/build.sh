set -ex
# Get latest version
URL=$(curl https://www.tp-link.com/us/support/download/eap245/ 2>/dev/null |grep linux_x64.tar.gz | awk -F ' ' '{ print $6 }' | awk -F '"' '{ print $2 }' |head -1)
VERSION=$(echo $URL | awk '{n=split($1,A,"/"); split(A[n],B,"_"); print B[3]}')
echo $VERSION > VERSION

# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=precurse
# image name
IMAGE=omada

docker build --build-arg URL=${URL}  -t $USERNAME/$IMAGE:latest .
docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$VERSION

