# Docker create commands
```bash
docker create --restart unless-stopped -p 69:69/udp --name tftpd -it precurse/tftpd
docker create --restart unless-stopped -p 3493:3493/tcp --device=/dev/bus/usb/001/004 --name nut -it precurse/nut
docker create --restart unless-stopped -p 80:80/tcp --name smartospxe -it precurse/smartospxe
docker create --restart unless-stopped -p 631:631/tcp --device=/dev/bus/usb/001/005 --name cups -it precurse/cups
```

## Syncthing
```bash
docker volume create --name syncthing-config
docker volume create --name syncthing-data
docker create --network=host --restart unless-stopped -p 8384:8384 -p 22000:22000 -p 21027:21027/udp -v syncthing-config:/var/syncthing -v syncthing-data:/data --name syncthing -it precurse/syncthing

docker-compose up -d --no-deps --build syncthing
```
