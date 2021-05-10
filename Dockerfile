FROM ubuntu
ENV TZ=Australia/Sydney
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get install -yq  openjdk-11-jre-headless
#RUN apt-get install -yq  stockfish
#RUN cp /usr/games/stockfish /sbin/
VOLUME /bin/
ADD /engine.jar  myapp.jar
ADD /stockfish  /sbin/stockfish
RUN sh -c 'touch /myapp.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/myapp.jar"]









