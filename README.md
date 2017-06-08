# Docker create commands
docker create -p 69:69/udp --name tftpd -it precurse/tftpd-alpine
docker create -p 3493:3493/tcp --device=/dev/bus/usb/001/004 --name nut -it precurse/nut-alpine

# Setup systemd to start containers on boot
cp systemd/docker-container@.service /etc/systemd/system/docker-container@.service
systemctl enable docker-container@ups.service
systemctl enable docker-container@nut.service
