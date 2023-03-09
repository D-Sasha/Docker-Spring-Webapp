# Dockerfile
FROM maven:3-jdk-11 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package

FROM tomcat:9-jdk11
COPY --from=builder /app/target/webapptest.war /usr/local/tomcat/webapps/
