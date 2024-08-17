#!/bin/bash
# This script handles the Kubernetes deployment

# Apply Kubernetes manifests
kubectl apply -f /home/ec2-user/my-app/k8s/deployment.yaml
kubectl apply -f /home/ec2-user/my-app/k8s/service.yaml
