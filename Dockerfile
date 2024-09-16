# Use the official Tomcat image with JDK 8
FROM tomcat:9.0.94-jdk8-corretto-al2 AS build-stage

# Install Maven in the container
RUN yum install maven -y

# Set the working directory and copy the project files
WORKDIR /app
RUN git clone https://github.com/tariq0621/game-of-life.git
            

# Navigate to the game-of-life directory and build the project using Maven
WORKDIR /app/game-of-life
RUN mvn clean package

# Multi-stage build: Use a clean Tomcat image to deploy the built WAR file
FROM tomcat:9.0.94-jdk8-corretto-al2

# Copy the generated WAR file from the build stage to the Tomcat webapps directory
COPY --from=build-stage /app/game-of-life/gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps/

# Expose port 8080
EXPOSE 8080

# Start Tomcat using its default command
CMD ["catalina.sh", "run"]