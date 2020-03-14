#FROM balenalib/raspberrypi3-64-debian-openjdk:latest
FROM sgtwilko/balenalib-rpi-raspbian-opencv:latest

# Install desktop environment
RUN apt-get update && install_packages xserver-xorg xinit xvfb

# Setting working directory
WORKDIR /usr/src/app

# Install OpenPnP
RUN install_packages git maven
RUN git clone https://github.com/openpnp/openpnp.git
RUN cd openpnp && mvn -DskipTests install && mkdir -p /root/.openpnp2
COPY machine.xml ~/.openpnp2/machine.xml

CMD ["bash", "start.sh"]
