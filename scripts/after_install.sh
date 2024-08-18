#!/bin/bash
# This script runs after the installation process

# Configure access to the Kubernetes cluster
aws eks --region us-east-1 update-kubeconfig --name 2048-eks-WbeQJfwY
