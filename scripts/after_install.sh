#!/bin/bash
# This script runs after the installation process
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
apt install unzip -y
sudo ./aws/install
#snap install aws-cli

# Configure access to the Kubernetes cluster
aws eks --region us-east-1 update-kubeconfig --name 2048-eks-WbeQJfwY
