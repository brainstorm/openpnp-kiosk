FROM balenalib/raspberrypi3-64-debian-openjdk:latest
#FROM sgtwilko/balenalib-rpi-raspbian-opencv:latest

# Install desktop environment
RUN apt-get update && install_packages xserver-xorg xinit xvfb

# Setting working directory
WORKDIR /usr/src/app

# Compile and install OpenCV (from https://linuxize.com/post/how-to-install-opencv-on-debian-10/)

RUN install_packages build-essential cmake ant git pkg-config libgtk-3-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev     libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev libatlas-base-dev python3-dev python3-numpy

RUN mkdir -p opencv_build
WORKDIR /usr/src/app/opencv_build
RUN git clone https://github.com/opencv/opencv && mkdir -p opencv/build
RUN git clone https://github.com/opencv/opencv_contrib && mkdir -p opencv_contrib/build
WORKDIR /usr/src/app/opencv_build/build
RUN cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_C_EXAMPLES=OFF \
    -D INSTALL_PYTHON_EXAMPLES=OFF \
    -D BUILD_JAVA=ON \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D OPENCV_EXTRA_MODULES_PATH=/usr/src/app/opencv_build/opencv_contrib/modules \
    -D BUILD_EXAMPLES=OFF .. && make install && pkg-config --modversion opencv4


# Install OpenPnP
RUN install_packages git maven wget
# Java headless might not cut it, install corretto-11 instead:
# RUN wget https://corretto.aws/downloads/latest/amazon-corretto-11-aarch64-linux-jdk.deb && dpkg -i amazon-corretto-11-aarch64-linux-jdk.deb
WORKDIR /usr/src/app
RUN git clone https://github.com/openpnp/openpnp.git
RUN cd openpnp && mvn -DskipTests install && mkdir -p /root/.openpnp2

# Copy relevant files
COPY start.sh start.sh
RUN chmod -x start.sh
COPY machine.xml /root/.openpnp2/machine.xml

CMD ["bash", "start.sh"]
