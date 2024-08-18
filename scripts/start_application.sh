#!/bin/bash
# /root/2048-scripts/scripts/start_application.sh

# Apply the Kubernetes manifests
kubectl apply -f /root/2048-scripts/scripts/deployment.yaml
kubectl apply -f /root/2048-scripts/scripts/service.yaml

