FROM maven:3.6.1-jdk-8 as maven_builder
RUN git clone https://github.com/tariq0621/game-of-life.git
WORKDIR /app/game-of-life
RUN mvn clean package

FROM tomcat:9.0.94-jdk11-corretto-al2
RUN yum install -y shadow-utils
RUN adduser shaif -d /app -s /bin/bash
COPY --from=maven_builder --chown=shaif:shaif /app/game-of-life/gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps
RUN yum install iputils -y
USER shaif
EXPOSE 8080
CMD [ "catalina.sh", "run" ]