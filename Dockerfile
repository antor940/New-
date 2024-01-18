# Use the latest Ubuntu image
FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    wget

# Set the working directory
WORKDIR /app

# Install JupyterLab
RUN pip3 install jupyterlab

# Install VS Code Server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Expose ports for JupyterLab and VS Code
EXPOSE 8080

# Start VS Code Server on port 8443
CMD ["code-server", "--auth=none", "--port=8443"]
