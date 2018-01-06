#!/bin/sh
IMAGE=smartospxe
USER=precurse
sudo docker stop $IMAGE
sudo docker rm $IMAGE
sudo docker create --restart unless-stopped -p 80:80/tcp --name $IMAGE -it $USER/$IMAGE
sudo docker start $IMAGE
