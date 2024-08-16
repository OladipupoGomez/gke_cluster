# Time API Deployment

## Overview

This project demonstrates how to deploy a simple time API to Google Cloud Platform (GCP) using Kubernetes (GKE) with Terraform for Infrastructure as Code (IaC) and GitHub Actions for Continuous Deployment (CD).

## Steps

1. **API Development**
   - Implemented in JavaScript using Express.
   - Dockerized the API using a Dockerfile.

2. **Infrastructure Setup**
   - Defined infrastructure using Terraform.
   - Configured GKE, VPC, NAT gateway, and Kubernetes resources.

3. **CI/CD Pipeline**
   - Implemented using GitHub Actions.
   - Automates the build, push, and deployment processes.

4. **Security**
   - Configured network security and NAT gateway.
   - Applied security best practices in Terraform configuration.

## How to Run Locally

1. Clone the repository.
2. Build the Docker image: `docker build -t time-checker-api .`
3. Run the Docker container: `docker run -p 8000:8000 time-checker-api`
4. Access the API at `http://localhost:8000/time`.

## Deployed API Endpoint

[Provide the public URL here]

## GitHub Actions Workflow

[Provide the GitHub Actions workflow run link here]
