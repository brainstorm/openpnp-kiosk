FROM balenalib/raspberrypi3-64:bullseye

# Install desktop environment...
RUN apt-get update && install_packages xserver-xorg-core \
    xinit xauth xterm aterm lxsession desktop-file-utils \
    matchbox-keyboard

# ...and required openpnp deps
RUN install_packages wget xvfb git wget maven ant \
                                       libjna-jni libtiff5 libjpeg62-turbo libpng16-16 libpng-sixlegs-java libatlas3-base \
                                       libgstreamer1.0-0 libgstreamer-plugins-base1.0-dev libgstreamer-gl1.0-0 \
                                       libgstreamer-plugins-bad1.0-0 libavcodec-extra58 libavformat58 libswscale5 \
                                       libv4l-0 libxvidcore4 libx264-155 \
                                       python3-numpy libopenblas0 libopenblas0-pthread libopenblas64-0 libopenblas64-0-pthread \
                                       liblapack3 liblapack64-3 liblapacke liblapacke64 \
                                       libmpfr6 libmpfi0

# disable lxpolkit popup warning
RUN mv /usr/bin/lxpolkit /usr/bin/lxpolkit.bak

RUN echo "#!/bin/bash" > /etc/X11/xinit/xserverrc \
  && echo "" >> /etc/X11/xinit/xserverrc \
  && echo 'exec /usr/bin/X -s 0 dpms -nolisten tcp "$@"' >> /etc/X11/xinit/xserverrc

# Setting working directory
WORKDIR /usr/src/app

# Install Corretto, since OpenJDK seems to be only available as JRE in Debian bullseye for ARM64
RUN wget https://corretto.aws/downloads/latest/amazon-corretto-11-aarch64-linux-jdk.deb && dpkg -i *.deb 
ENV JAVA_HOME /usr/lib/jvm/java-11-amazon-corretto

# Install OpenPnP
WORKDIR /usr/src/app
RUN git clone --depth 1 https://github.com/CCHS-Melbourne/openpnp.git
RUN cd openpnp && mvn -DskipTests install && mkdir -p /root/.openpnp2

# Copy relevant files and apply hacks
COPY objs/libopencv_java342.so /usr/src/app
COPY objs/libopenpnp-capture.so /usr/src/app
COPY objs/openpnp-capture-java-0.0.19.jar openpnp/target/lib
RUN rm openpnp/target/lib/openpnp-capture-java-0.0.17.jar
RUN ln -sf /usr/lib/aarch64-linux-gnu/jni/libjnidispatch.system.so /usr/lib/aarch64-linux-gnu/jni/libjnidispatch.so
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/src/app:/usr/lib/aarch64-linux-gnu/jni
ENV CLASSPATH $CLASSPATH:/usr/src/app

# Provision OpenPNP configuration, to be refined with more accessible remote provisioning
RUN mkdir -p /root/.openpnp2
COPY config/machine.xml /root/.openpnp2/machine.xml
COPY config/parts.xml /root/.openpnp2/parts.xml
COPY config/packages.xml /root/.openpnp2/packages.xml

# Prepare to start the kiosk
COPY start.sh start.sh
RUN chmod -x start.sh

ENV UDEV=1

CMD ["bash", "start.sh"]
