# Docker create commands
```bash
docker create -p 69:69/udp --name tftpd -it precurse/tftpd-armhf
docker create -p 3493:3493/tcp --device=/dev/bus/usb/001/004 --name nut -it precurse/nut-armhf
docker create -p 80:80/tcp --name smartospxe -it precurse/smartospxe-armhf
```

## Syncthing
```bash
docker volume create --name syncthing-config
docker volume create --name syncthing-data
docker create -p 8384:8384 -p 22000:22000 -p 21027:21027/udp -v syncthing-config:/var/syncthing -v syncthing-data:/data --name syncthing -it precurse/syncthing-armhf
```

# Setup systemd to start containers on boot
```bash
cp systemd/docker-container@.service /etc/systemd/system/docker-container@.service
systemctl enable docker-container@tftpd.service
systemctl enable docker-container@nut.service
systemctl enable docker-container@smartospxe.service
systemctl enable docker-container@syncthing.service
```
