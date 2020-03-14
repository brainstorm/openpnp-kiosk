FROM balenalib/raspberrypi3-64-debian-openjdk:latest

# Install desktop environment
RUN apt-get update && install_packages xserver-xorg xinit xvfb

#RUN echo "#!/bin/bash" > /etc/X11/xinit/xserverrc \
#  && echo "" >> /etc/X11/xinit/xserverrc \
#  && echo 'exec /usr/bin/X -s 0 dpms -nolisten tcp "$@"' >> /etc/X11/xinit/xserverrc

# Setting working directory
WORKDIR /usr/src/app

COPY start.sh start.sh
RUN chmod -x start.sh

# Adding things to autostart will cause them to be launchd automatically on starup
#COPY autostart /etc/xdg/lxsession/LXDE-pi/autostart

ENV UDEV=1

# Install OpenPnP
RUN install_packages git maven
RUN git clone https://github.com/openpnp/openpnp.git
RUN cd openpnp && mvn -DskipTests install && mkdir -p ~/.openpnp2
COPY machine.xml ~/.openpnp2/machine.xml

CMD ["bash", "-c", "/usr/src/app/start.sh"]
