#!/bin/sh
chown nut:nut /dev/bus/usb/001/004
usbhid-ups -a Cyberpower &
upsd -D