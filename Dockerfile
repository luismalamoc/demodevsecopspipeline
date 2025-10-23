# Stage 1: Build
FROM gradle:8.11.1-jdk21-alpine AS build
WORKDIR /app
COPY build.gradle settings.gradle ./
COPY src ./src
RUN gradle build --no-daemon -x test

# Stage 2: Runtime
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Config user
RUN addgroup -S spring && adduser -S spring -G spring

# Copy JAR
COPY --from=build /app/build/libs/*.jar app.jar

# Change ownership
RUN chown spring:spring app.jar

# Change user
USER spring:spring

# Expose
EXPOSE 8080

# Execute
ENTRYPOINT ["java", "-jar", "app.jar"]
