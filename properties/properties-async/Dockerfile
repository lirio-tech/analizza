# Native runtime image for properties-async
FROM debian:bookworm-slim

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl \
    && rm -rf /var/lib/apt/lists/*

COPY properties/properties-async/build/native/nativeCompile/properties-async /app/properties-async

EXPOSE 8081

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -fsS http://localhost:8081/actuator/health || exit 1

ENTRYPOINT ["/app/properties-async"]
