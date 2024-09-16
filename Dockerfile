FROM tomcat:9.0.94-jdk8-corretto-al2 AS build-stage
RUN yum install maven -y
RUN yum install git -y
WORKDIR /app
RUN git clone https://github.com/tariq0621/game-of-life.git
WORKDIR /app/game-of-life
RUN mvn clean package
FROM tomcat:9.0.94-jdk8-corretto-al2
COPY --from=build-stage /app/game-of-life/gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]