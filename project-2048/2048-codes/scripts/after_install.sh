#!/bin/bash
# This script runs after the installation process

# Configure access to the Kubernetes cluster
aws eks --region <your-region> update-kubeconfig --name <your-cluster-name>
