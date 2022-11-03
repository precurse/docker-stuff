#!/bin/sh
IMAGE=syncthing
USER=precurse
podman stop $IMAGE
podman rm $IMAGE
systemctl --user stop container-syncthing
podman create --network=host --restart unless-stopped --security-opt label=disable --userns=keep-id -u 1000:1000 -v syncthing-config:/var/syncthing -v ${HOME}/syncthing:/data:Z --name $IMAGE -it $USER/$IMAGE
podman generate  systemd --new --restart-policy=always syncthing > ~/.config/systemd/user/container-syncthing.service
systemctl --user daemon-reload
systemctl --user enable container-syncthing
systemctl --user start container-syncthing
