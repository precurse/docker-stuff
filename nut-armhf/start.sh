#!/bin/sh
chown nut:nut /dev/bus/usb/001/004
usbhid-ups -a Cyberpower &
sleep 2
upsd -D
