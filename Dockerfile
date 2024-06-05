# Use the official Rust image as the base image
FROM rust:latest

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y cmake pkg-config libssl-dev git clang

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container
COPY . .

# Build the node
RUN cargo build --release

# Expose the default port for Substrate
EXPOSE 9944

# Run the Substrate node
CMD ["./target/release/node-template", "--dev", "--ws-external"]