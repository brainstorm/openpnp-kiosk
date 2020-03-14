#FROM balenalib/raspberrypi3-64-debian-openjdk:latest
FROM sgtwilko/balenalib-rpi-raspbian-opencv:latest

# Install desktop environment
RUN apt-get update && install_packages xserver-xorg xinit xvfb

# Setting working directory
WORKDIR /usr/src/app

# Install OpenPnP
RUN install_packages git maven wget
# Java headless might not cut it, install corretto-11 instead:
# RUN wget https://corretto.aws/downloads/latest/amazon-corretto-11-aarch64-linux-jdk.deb && dpkg -i amazon-corretto-11-aarch64-linux-jdk.deb
RUN git clone https://github.com/openpnp/openpnp.git
RUN cd openpnp && mvn -DskipTests install && mkdir -p /root/.openpnp2

# Copy relevant files
COPY start.sh start.sh
RUN chmod -x start.sh
COPY machine.xml /root/.openpnp2/machine.xml

CMD ["bash", "start.sh"]
