FROM alpine:latest

# Install curl and unzip
RUN apk add --no-cache curl unzip

WORKDIR /app

# Download latest PocketBase release
RUN curl -L -o pocketbase.zip https://github.com/pocketbase/pocketbase/releases/latest/download/pocketbase-linux-amd64.zip && \
    unzip pocketbase.zip && \
    rm pocketbase.zip && \
    chmod +x pocketbase

# Default command: serve and store data in mounted volume
CMD ["./pocketbase", "serve", "--dir", "/pb_data"]
