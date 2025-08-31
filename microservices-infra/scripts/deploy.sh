#!/bin/bash

set -e

# Load environment variables from .env file
if [ -f ../.env ]; then
    export $(grep -v '^#' ../.env | xargs)
fi

# Define the Kubernetes namespace
NAMESPACE="microservices"

# Apply the Kubernetes namespace
kubectl apply -f ../k8s/namespace.yml

# Deploy the services
for deployment in ../k8s/deployments/*.yml; do
    kubectl apply -f "$deployment" -n "$NAMESPACE"
done

# Apply the services
for service in ../k8s/services/*.yml; do
    kubectl apply -f "$service" -n "$NAMESPACE"
done

# Apply the configmaps
for configmap in ../k8s/configmaps/*.yml; do
    kubectl apply -f "$configmap" -n "$NAMESPACE"
done

# Apply the secrets
for secret in ../k8s/secrets/*.yml; do
    kubectl apply -f "$secret" -n "$NAMESPACE"
done

# Wait for all deployments to be ready
kubectl rollout status deployment --all -n "$NAMESPACE"

echo "Deployment completed successfully."