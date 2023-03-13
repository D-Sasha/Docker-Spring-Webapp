# Use an official OpenJDK runtime as a parent image
FROM adoptopenjdk/openjdk11:alpine-slim

# Set the working directory to /app
WORKDIR /app

# Copy the contents of the local directory into the container at /app
COPY . /app

# Run Maven to build the application
RUN apk add --no-cache maven
RUN dos2unix mvnw
RUN ./mvnw package

# Run Maven to build the application
RUN ./mvnw package

# Set the command to run the application when the container starts
CMD ["java", "-jar", "target/spring-webapp.jar"]