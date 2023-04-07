#!/bin/bash -x

# Display on Balena's env results in wrong host:number, using DISPLAY
# locally instead

function set_hostname {
	echo "pnp.local" > /etc/hostname
}

# Makes sure the usb devices work between the host and docker container
# That is USB mouse, keyboard, cameras, control board(s), etc...
# 
# Also launches x11
function x11_and_usb {
	rm /tmp/.X0-lock &>/dev/null || true

	export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket
	export UDEV=1

	# USB mouse/keyboard not responding on container: https://forums.balena.io/t/x11-hotplug-usb/7250/30
	if which udevadm > /dev/null; then
	  set +e # Disable exit on error
	  udevadm control --reload-rules
	  service udev restart
	  udevadm trigger
	  set -e # Re-enable exit on error
	fi

	echo "Starting X"
	startx
}


## Inspired by:
# https://github.com/nucleardreamer/xserver-web-vnc
# https://github.com/balena-io-playground/balena-vnc-example
function no_vnc {
	echo "\n#"
	echo "# Starting x11vnc"
	echo "#"

	#echo "Setting ideal resolution w/ xvfb"

	#Xvfb :0 -screen 0 1280x720x24

	x11vnc \
	  -listen "localhost" \
	  -no6 \
	  -shared \
	  -alwaysshared \
	  -bg \
	  -forever \
	  -ncache 10 \
	  -quiet \
	  -geometry "1024x768" \
#	  "$VNC_PASS"

	echo "\n#"
	echo "# Starting novnc"
	echo "#\n"

	exec websockify --web /usr/share/novnc $VNC_WEB_PORT localhost:$VNC_PORT
}


# Start the X and connect them to the web!
set_hostname
x11_and_usb
#no_vnc

while :
do
	echo "just waiting over here while you debug! Otherwise the
	app/docker container will keep re-spawning impossibly :-!"
	sleep 30
done
