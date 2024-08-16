set -e

# Pull the Docker image from Docker Hub
docker pull vishaldock7/simple-python-flask-app:latest

# Exit on any error
set -e

# Apply Kubernetes manifests
echo "Deploying application to Kubernetes..."

# Replace with the path to your Kubernetes manifests
kubectl apply -f /home/ec2-user/myapp/deployment.yaml 
kubectl apply -f /home/ec2-user/myapp/service.yaml 

# Optionally, check the status of the deployment
kubectl rollout status deployment/my-python-app 

echo "Application deployment started successfully!"
