FROM balenalib/raspberrypi3-64-openjdk:bullseye-20200221

# Install desktop environment and required openpnp deps
RUN apt-get update && install_packages wget xserver-xorg xinit xvfb git wget maven ant libopencv4.2-java

# Setting working directory
WORKDIR /usr/src/app

# Install OpenPnP
# Java headless might not cut it, install corretto-11 instead:
# RUN wget https://corretto.aws/downloads/latest/amazon-corretto-11-aarch64-linux-jdk.deb && dpkg -i amazon-corretto-11-aarch64-linux-jdk.deb
WORKDIR /usr/src/app
RUN git clone --depth 1 https://github.com/CCHS-Melbourne/openpnp.git
RUN wget https://github.com/openpnp/opencv/raw/develop/src/main/resources/nu/pattern/opencv/linux/ARMv8/libopencv_java342.so
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/src/app
RUN cd openpnp && mvn -DskipTests install && mkdir -p /root/.openpnp2

# Copy relevant files
COPY start.sh start.sh
RUN chmod -x start.sh
COPY machine.xml /root/.openpnp2/machine.xml

CMD ["bash", "start.sh"]
