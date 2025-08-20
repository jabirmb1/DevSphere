# VS Code Server base image
FROM codercom/code-server:latest

# Set working directory
WORKDIR /home/coder

# Install basic tools (optional, add more as needed)
RUN sudo apt-get update && \
    sudo apt-get install -y git curl unzip openjdk-17-jdk && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*

# Expose port
EXPOSE 8080

# Use PASSWORD env variable for login
ENV PASSWORD=mypass

# Start code-server
CMD ["code-server", "--bind-addr", "0.0.0.0:8080"]
