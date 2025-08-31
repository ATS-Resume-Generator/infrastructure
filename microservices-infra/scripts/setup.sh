#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Build Docker images for all services
echo "Building Docker images..."
docker-compose build

# Start services in detached mode
echo "Starting services..."
docker-compose up -d

# Wait for services to be ready
echo "Waiting for services to be ready..."
sleep 10  # Adjust this time as necessary based on service startup times

# Display the status of the services
echo "Services are up and running:"
docker-compose ps

# Print instructions for accessing the services
echo "You can access the services at the following URLs:"
echo "Nginx: http://localhost:80"
echo "MongoDB: mongodb://localhost:27017"
echo "Redis: redis://localhost:6379"

# Optionally, you can add more setup steps here if needed
# For example, initializing databases or seeding data

echo "Local development environment setup complete."