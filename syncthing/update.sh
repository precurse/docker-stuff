#!/bin/sh
IMAGE=syncthing
USER=precurse
sudo docker stop $IMAGE
sudo docker rm $IMAGE
sudo docker create --network=host --restart unless-stopped -p 8384:8384 -p 22000:22000 -p 21027:21027/udp -v syncthing-config:/var/syncthing -v syncthing-data:/data --name $IMAGE -it $USER/$IMAGE
sudo docker start $IMAGE
