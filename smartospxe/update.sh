#!/bin/sh
sudo docker stop smartospxe
sudo docker rm smartospxe
sudo docker create --restart unless-stopped -p 80:80/tcp --name smartospxe -it precurse/smartospxe
sudo docker start smartospxe
