FROM balenalib/raspberrypi3-64-openjdk:bullseye-20200221

# Install desktop environment and required openpnp deps
RUN apt-get update && install_packages wget xserver-xorg xinit xvfb git wget maven ant

# Setting working directory
WORKDIR /usr/src/app

# Install OpenPnP
WORKDIR /usr/src/app
RUN git clone --depth 1 https://github.com/CCHS-Melbourne/openpnp.git
RUN cd openpnp && mvn -DskipTests install && mkdir -p /root/.openpnp2

# Copy relevant files
COPY libopencv_java342.so /usr/src/app/libopencv_java342.so
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/src/app
COPY start.sh start.sh
RUN chmod -x start.sh
COPY machine.xml /root/.openpnp2/machine.xml

CMD ["bash", "start.sh"]
