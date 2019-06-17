FROM arm64v8/openjdk

RUN apt-get install git maven
RUN git clone https://github.com/openpnp/openpnp.git
RUN cd openpnp && mvn package
