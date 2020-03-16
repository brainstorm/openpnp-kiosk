FROM balenalib/raspberrypi3-64:bullseye

# Install desktop environment and required openpnp deps
RUN apt-get update && install_packages wget xserver-xorg xinit xvfb git wget maven ant libjna-java libtiff5

# Setting working directory
WORKDIR /usr/src/app

# Install Corretto, since OpenJDK seems to be only available as JRE in Debian bullseye for ARM64
RUN wget https://corretto.aws/downloads/latest/amazon-corretto-11-aarch64-linux-jdk.deb && dpkg -i *.deb 
ENV JAVA_HOME /usr/lib/jvm/java-11-amazon-corretto

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
