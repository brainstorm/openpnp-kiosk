FROM amazoncorretto:11
#FROM openjdk:11-jre-alpine

RUN yum install -y git maven
RUN git clone https://github.com/openpnp/openpnp.git
RUN cd openpnp && mvn package
