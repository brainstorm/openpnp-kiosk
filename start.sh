#!/bin/bash

rm /tmp/.X0-lock &>/dev/null || true

export DISPLAY=:0
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

# USB mouse/keyboard not responding on container: https://forums.balena.io/t/x11-hotplug-usb/7250/30
#if which udevadm > /dev/null; then
#  set +e # Disable exit on error
#  udevadm control --reload-rules
#  service udev restart
#  udevadm trigger
#  set -e # Re-enable exit on error
#fi

echo "Starting X in 2 seconds"
sleep 2
#startx /usr/src/app/openpnp/openpnp.sh 
startx

while :
do
	echo "startx failed, so we will just wait here while you debug!"
	sleep 30
done
