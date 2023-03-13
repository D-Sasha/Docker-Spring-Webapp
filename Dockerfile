FROM openjdk:11-jre-slim

WORKDIR /app

COPY . .

# Add execute permissions to the Maven Wrapper script
RUN chmod +x mvnw

# Build the application with Maven
RUN ./mvnw package

EXPOSE 8080

CMD ["java", "-jar", "./target/webapp-0.0.1-SNAPSHOT.jar"]
