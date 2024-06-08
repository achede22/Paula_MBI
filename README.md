# Paula_MBI Challenge

This repository contains the solution for the challenge given by Paula from MBI. The challenge was to deploy a sample API with several replicas and its database using persistent storage on Azure Kubernetes Service (AKS), adhering to the best practices in the technology.

## Challenge Overview

The challenge was to:

- Deploy a sample API with potentially several replicas and its database using persistent storage on AKS.
- Ensure that the API is accessible from the outside, while the database is not.
- Use Helm to define, install, and manage applications.
- Configure the database for optimal performance and monitor it for potential issues.
- Implement measures for database backups and disaster recovery.
- Use Infrastructure as Code (IaC) technologies like Terraform.
- Include a user story that drives the deployment.

## Solution

The solution includes:

- Terraform code to create the necessary resources.
- Helm charts to describe all cluster resource sets.
- Dockerfiles for sample images.
- A user story to organize the deployment.

## User Story

The user story for this deployment is as follows:

As a developer, I want to deploy a sample API with several replicas and its database on AKS so that I can ensure high availability and scalability. I want the API to be accessible from the outside, but the database should not be. I want to use Helm to manage my applications and Terraform to manage my infrastructure. I want to ensure that the database is configured for optimal performance and is being monitored for potential issues. I also want to implement measures for database backups and disaster recovery.

## Current Status

Currently, the project includes some Terraform modules, ArgoCD installed from Terraform, and a pipeline from GitHub Actions that continues the process of installing some apps inside ArgoCD.

## Monitoring and Alerting

For monitoring and alerting, we will use the Grafana Stack (LGTM). Grafana allows us to visualize, explore, and alert on metrics from mixed sources. It will be deployed inside ArgoCD.


## Future Work

The project is not yet complete. The next steps are to:

- Complete the Helm charts for all cluster resource sets.
- Implement database performance tuning, monitoring, and alerting.
- Implement automated backups and disaster recovery procedures.
- Improve the code quality and organization.
- Complete the deployment to Azure Cloud (optional).

## Running the Project

There are two ways to run the project:

1. **Using Terraform**

    Use the following commands:

    ```bash
    terraform plan -var-file=environment-variables/sandbox.tfvars
    terraform apply -var-file=environment-variables/sandbox.tfvars
    ```

2. **Using GitHub Actions**

    You can also run the GitHub Actions pipeline to run the project. To do this, go to the "Actions" tab in the GitHub repository and run the desired workflow. (To be checked)

# Thanks for this opportunity!
# HD