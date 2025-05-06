# Use a Java 17 base image
FROM openjdk:17-jdk-slim AS build
ENV TZ=UTC


# Set the working directory inside the container
WORKDIR /app

# Copy the jar file from your local machine (target folder)
COPY target/gateway-router-0.0.1-SNAPSHOT.jar gateway-router.jar


# Command to run the Spring Boot application
ENTRYPOINT ["java", "-jar", "gateway-router.jar"]
