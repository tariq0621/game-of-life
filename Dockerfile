1 FROM maven:3.6.1-jdk-8 as maven_builder
  2 COPY . /app
  3 WORKDIR /app/game-of-life
  4 RUN mvn clean package
  5
  6
  7 FROM tomcat:9.0.94-jdk11-corretto-al2
  8 RUN yum install -y shadow-utils
  9 RUN adduser shaif -d /app -s /bin/bash
 10
 11 RUN chown -R shaif:shaif /usr/local/tomcat/webapps
 12 COPY --from=maven_builder --chown=shaif:shaif /app/game-of-life/gameoflife-web/target/gameoflife.war /usr/local/tomc    at/webapps
 13 RUN yum install iputils -y
 14 USER shaif
 15 EXPOSE 8080
 16
 17 CMD [ "catalina.sh", "run" ]
 18
~                                                                                                                       ~