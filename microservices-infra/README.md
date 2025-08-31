# Microservices Infrastructure Project

This project provides a complete infrastructure-as-code setup for deploying a microservices architecture using Docker and Kubernetes. It includes configurations for local development, production deployment, CI/CD pipelines, and monitoring.

## Project Structure

```
microservices-infra
├── docker-compose.yml          # Multi-service local development environment
├── docker-compose.prod.yml     # Production-like environment configuration
├── .env.example                # Environment variable template
├── README.md                   # Project documentation
├── nginx
│   └── nginx.conf              # Nginx reverse proxy configuration
├── monitoring
│   ├── prometheus.yml          # Prometheus metrics collection configuration
│   └── grafana
│       └── grafana-dashboard.json # Grafana dashboard configuration
├── k8s
│   ├── namespace.yml           # Kubernetes namespace definition
│   ├── deployments             # Deployment configurations for each service
│   ├── services                # Service configurations for each microservice
│   ├── configmaps              # ConfigMaps for application configuration
│   └── secrets                 # Kubernetes Secrets for sensitive information
├── .github
│   └── workflows
│       └── deploy.yml          # GitHub Actions CI/CD pipeline
├── scripts
│   ├── deploy.sh               # Deployment automation script
│   └── setup.sh                # Local development setup script
```

## Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd microservices-infra
   ```

2. **Environment Variables**
   - Copy the `.env.example` to `.env` and fill in the required values.
   ```bash
   cp .env.example .env
   ```

3. **Local Development Setup**
   - Use Docker Compose to start the local development environment.
   ```bash
   docker-compose up
   ```

4. **Production Deployment**
   - For production-like deployment, use the following command:
   ```bash
   docker-compose -f docker-compose.prod.yml up
   ```

5. **Kubernetes Deployment**
   - Ensure you have access to a Kubernetes cluster and run the deployment script:
   ```bash
   ./scripts/deploy.sh
   ```

## Usage

- Access the services through the API Gateway configured in Nginx.
- Monitor the services using Prometheus and Grafana dashboards.

## Deployment Guidelines

- The CI/CD pipeline is defined in `.github/workflows/deploy.yml`. It automates the deployment process to the Kubernetes cluster on code changes.
- Ensure that all secrets are properly configured in the `k8s/secrets` directory before deploying to production.

## Monitoring

- Prometheus is configured to scrape metrics from the microservices, and Grafana is set up to visualize these metrics.
- Modify the `monitoring/prometheus.yml` and `monitoring/grafana/grafana-dashboard.json` files as needed for custom metrics and dashboards.

## Backup and Recovery

- Implement backup strategies for persistent data stored in MongoDB and Redis.
- Regularly test recovery procedures to ensure data integrity and availability.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.