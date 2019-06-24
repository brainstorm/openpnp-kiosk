FROM balenalib/raspberrypi3-debian:stretch-run

COPY sources.list /etc/apt/sources.list
COPY raspi.list /etc/apt/sources.list.d/raspi.list

# Install OpenPnP
# RUN apt-get update && apt-get install -y git maven openjdk-11
# RUN git clone https://github.com/openpnp/openpnp.git
# RUN cd openpnp && mvn -DskipTests install

# Install desktop environment
RUN install_packages xserver-xorg \
    xinit lxsession desktop-file-utils \
    raspberrypi-ui-mods rpd-icons \
    gtk2-engines-clearlookspix \
    matchbox-keyboard

# disable lxpolkit popup warning
RUN mv /usr/bin/lxpolkit /usr/bin/lxpolkit.bak

RUN echo "#!/bin/bash" > /etc/X11/xinit/xserverrc \
  && echo "" >> /etc/X11/xinit/xserverrc \
  && echo 'exec /usr/bin/X -s 0 dpms -nolisten tcp "$@"' >> /etc/X11/xinit/xserverrc

# Setting working directory
WORKDIR /usr/src/app

COPY start.sh start.sh

# Adding things to autostart will cause them to be launchd automatically on starup
COPY autostart /etc/xdg/lxsession/LXDE-pi/autostart

ENV UDEV=1

CMD ["bash", "start.sh"]
