# AWS EC2 Docker Node.js Deployment using Terraform

## Project Overview

This project demonstrates how to deploy a Dockerised Node.js application on an AWS EC2 instance using Terraform.

The application is a simple Node.js/Express service with a health-check endpoint. The long-term goal of this project is to provision the AWS infrastructure using Terraform, install Docker on an EC2 instance, run the application inside a Docker container, and expose it publicly through Nginx as a reverse proxy.

This is Project 02 in my Cloud Engineer portfolio roadmap. It builds on my previous AWS EC2 Terraform Nginx project by introducing Docker, application containerisation, and a more realistic application deployment workflow.

---

## Current Status

**Project stage:** Day 1 — Local Express application setup

Completed so far:

- Created the GitHub repository
- Created a basic Node.js/Express application
- Added a root `/` endpoint
- Added a `/health` health-check endpoint
- Configured the app to listen on port `3000`
- Tested the app locally in GitHub Codespaces

---

## Planned Architecture

```text
User Browser
    -> EC2 Public IP
    -> Nginx Reverse Proxy
    -> Docker Container
    -> Node.js Express App

The final version of this project will use:

AWS EC2 for compute
Terraform for infrastructure provisioning
Docker for application containerisation
Nginx as a reverse proxy
Security Groups for controlled network access
GitHub for version control and documentation
What This Project Will Deploy

By the end of the project, Terraform will provision:

AWS VPC
Public subnet
Internet Gateway
Public route table
Route table association
Security Group
SSH key pair
Ubuntu EC2 instance

The EC2 instance will be configured to run:

Docker
Nginx
A Dockerised Node.js/Express application
Technology Stack
AWS
EC2
Terraform
Docker
Node.js
Express.js
Nginx
Ubuntu Linux
GitHub
GitHub Codespaces
Repository Structure
aws-ec2-docker-nodejs-terraform/
│
├── app/
│   ├── src/
│   │   └── server.js
│   ├── package.json
│   ├── package-lock.json
│   └── Dockerfile
│
├── infra/
│   ├── providers.tf
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── user-data.sh
│   └── terraform.tfvars.example
│
├── docs/
│   ├── architecture/
│   │   └── architecture.md
│   ├── screenshots/
│   ├── security-notes.md
│   ├── cost-notes.md
│   └── learning-log.md
│
├── .github/
│   └── workflows/
│       └── docker-check.yml
│
├── README.md
└── .gitignore

Note: Some folders and files will be added incrementally as the project progresses from Day 1 to Day 7.
```