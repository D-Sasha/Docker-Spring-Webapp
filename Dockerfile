# Use an official OpenJDK runtime as a parent image
FROM adoptopenjdk/openjdk11:alpine-slim

ADD target/webapptest.jar webapptest.jar

# Set the working directory to /app
WORKDIR /app

# Copy the contents of the local directory into the container at /app
COPY . /app

# Run Maven to build the application
RUN apk add --no-cache maven
RUN dos2unix mvnw
RUN chmod +x mvnw
RUN ./mvnw package

# Expose port 8080
EXPOSE 8080

# Set the command to run the application when the container starts
CMD ["java", "-jar", "target/webapptest.jar"]