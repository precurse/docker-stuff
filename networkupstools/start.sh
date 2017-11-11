#!/bin/sh
chown -R nut:nut /dev/bus/
usbhid-ups -a Cyberpower &
sleep 2
upsd -D
