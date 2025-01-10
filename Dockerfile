# Filename: Dockerfile   (no .txt) , copy below 4 lines to docker file withou comments
# from  jdk version 17 is used to build the image
FROM openjdk:17-jdk-alpine3.13

# Set the working directory in the container
WORKDIR /app
# Copy the JAR file into the container at /app
COPY demo-1.0.0-SNAPSHOT.jar /app/demo-1.0.0-SNAPSHOT.jar
# Run the JAR file
ENTRYPOINT ["java", "-jar", "demo-1.0.0-SNAPSHOT.jar"]

# Tips: 
# download project from github
# https://github.com/manikantabandaru/CollegeApp


# docker build -t workshop .  
# docker run -p 8081:8081 workshop  (Ex 1)
# docker run -p 8081:8081 -d workshop  (runs in deamon mode)  ((Ex 1)
# docker run -p 8081:8081 -d workshop  -v .:/tmp/logs  (Ex 2)
# docker ps
#  docker logs -f  <docker image id>   (Ex 3)
# docker exec -it <docker image id> /bin/sh   (Ex 3)


# docker run -p 8082:8082 --env JAVA_OPTS=-Dspring.port=8082 -d workshop  (Ex 4)


# http://localhost:8081/workshop