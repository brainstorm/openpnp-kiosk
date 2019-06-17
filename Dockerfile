FROM arm64v8/maven:slim

RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/openpnp/openpnp.git
RUN cd openpnp && mvn package
