# Use lightweight Java runtime
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy JAR file (build/libs/app.jar)
COPY build/libs/*.jar app.jar

# Expose application port (change if your app uses a different port)
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]

