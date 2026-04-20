# Dockerfile for properties-async (Async Processing Worker)
# Multi-stage build

FROM eclipse-temurin:25-jdk AS builder
WORKDIR /app
COPY gradle ./gradle
COPY gradle.properties .
COPY settings.gradle.kts .
COPY build.gradle.kts .
COPY gradlew .
COPY shared-libs ./shared-libs
COPY properties/properties-core ./properties/properties-core
COPY properties/properties-api ./properties/properties-api
COPY properties/properties-async ./properties/properties-async

RUN chmod +x gradlew && ./gradlew :properties:properties-async:build -x test

# Runtime stage
FROM eclipse-temurin:25-jre
WORKDIR /app

# Copy JAR from builder
COPY --from=builder /app/properties/properties-async/build/libs/properties-async-*.jar app.jar

# Health check using actuator
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8081/actuator/health || exit 1

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "app.jar"]
