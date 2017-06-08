# Docker create commands
docker create -p 69:69/udp --name tftpd -it precurse/tftpd-alpine
docker create -p 3493:3493/tcp --device=/dev/bus/usb/001/004 --name nut -it precurse/nut-alpine
docker create -p 80:80/tcp --name smartospxe -it precurse/smartospxe

# Setup systemd to start containers on boot
cp systemd/docker-container@.service /etc/systemd/system/docker-container@.service
systemctl enable docker-container@tftpd.service
systemctl enable docker-container@nut.service
systemctl enable docker-container@smartospxe.service
