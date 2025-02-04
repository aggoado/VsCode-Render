# Use an official Ubuntu runtime as a parent image
FROM ubuntu:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install required tools
RUN apt-get update -y && \
    apt-get install -y wget curl && \
    curl -fsSL https://code-server.dev/install.sh | sh

# Set environment variable for the port
EXPOSE 10000
ENV PORT=10000


# Start VSCode
CMD code-server --host 0.0.0.0 --port $PORT --disable-telemetry --auth none
