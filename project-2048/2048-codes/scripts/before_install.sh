#!/bin/bash
# This script runs before the installation process

# Update the package list and install Docker
sudo apt-get update -y
sudo apt-get install -y docker.io

# Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# Install kubectl if not already installed
if ! command -v kubectl &> /dev/null
then
    curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
fi

# Pull the Docker image from your registry
docker pull vishaldock7/2048-app-image:latest

