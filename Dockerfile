# Filename: Dockerfile   (no .txt) , copy below 4 lines to docker file withou comments
# from  jdk version 17 is used to build the image
FROM openjdk:17-jdk-alpine3.13

# Set the working directory in the container
WORKDIR /app
# Copy the JAR file into the container at /app
COPY demo-1.0.0-SNAPSHOT.jar /app/demo-1.0.0-SNAPSHOT.jar
# Run the JAR file
ENTRYPOINT ["java", "-jar", "demo-1.0.0-SNAPSHOT.jar"]

