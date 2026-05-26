# AWS EC2 Docker Node.js Deployment using Terraform

## Project Overview

This project demonstrates how to deploy a Dockerised Node.js application on an AWS EC2 instance using Terraform.

The application is a simple Node.js/Express service with a health-check endpoint. The long-term goal of this project is to provision AWS infrastructure using Terraform, install Docker on an EC2 instance, run the application inside a Docker container, and expose it publicly through Nginx as a reverse proxy.

This is Project 02 in my Cloud Engineer portfolio roadmap. It builds on my previous AWS EC2 Terraform Nginx project by introducing Docker, application containerisation, and a more realistic application deployment workflow.

---

## Current Status

**Project stage:** Day 3 — Terraform provider and variables

### Completed so far

- Created the GitHub repository
- Created a basic Node.js/Express application
- Added a root `/` endpoint
- Added a `/health` health-check endpoint
- Configured the app to listen on port `3000`
- Added `package-lock.json` for reproducible dependency installation
- Created a `Dockerfile` for the Express application
- Created a `.dockerignore` file
- Built the Docker image locally
- Ran the app inside a Docker container locally

---

## Architecture

### Current local Docker architecture

```text
Local Browser / curl
    -> localhost:3000
    -> Docker Container
    -> Node.js Express App
```

### Planned AWS architecture

```text
User Browser
    -> EC2 Public IP
    -> Nginx Reverse Proxy
    -> Docker Container
    -> Node.js Express App
```

### What This Project Will Deploy

By the end of the project, Terraform will provision:

- AWS VPC
- Public subnet
- Internet Gateway
- Public route table
- Route table association
- Security Group
- SSH key pair
- Ubuntu EC2 instance

The EC2 instance will be configured to run:

- Docker
- Nginx
- A Dockerised Node.js/Express application

---

## Technology Stack

- AWS
- EC2
- Terraform
- Docker
- Node.js
- Express.js
- Nginx
- Ubuntu Linux
- GitHub
- GitHub Codespaces

---

## Repository Structure

```text
aws-ec2-docker-nodejs-terraform/
│
├── app/
│   ├── src/
│   │   └── server.js
│   ├── package.json
│   ├── package-lock.json
│   ├── Dockerfile
│   └── .dockerignore
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
```

Some folders and files will be added incrementally as the project progresses from Day 1 to Day 7.

---

## Application Overview

The current application is a basic Express.js API.

| Method | Endpoint | Purpose |
|--------|----------|---------|
| GET    | `/`      | Returns basic project and runtime information |
| GET    | `/health` | Returns application health status |

The `/health` endpoint is included because health checks are commonly used in cloud deployments, load balancers, monitoring tools, and CI/CD validation steps.

---

## Local Development

1. Navigate to the app folder:
   ```bash
   cd app
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Run the application locally:
   ```bash
   npm start
   ```
4. Test the application:
   ```bash
   curl http://localhost:3000
   curl http://localhost:3000/health
   ```

---

## Docker Usage

1. Build the Docker image from the `app/` folder:
   ```bash
   docker build -t nodejs-cloud-app .
   ```
2. Run the Docker container:
   ```bash
   docker run -d --name nodejs-cloud-app -p 3000:3000 nodejs-cloud-app
   ```
3. Check the running container:
   ```bash
   docker ps
   ```
4. Test the containerised app:
   ```bash
   curl http://localhost:3000
   curl http://localhost:3000/health
   ```
5. Check container logs:
   ```bash
   docker logs nodejs-cloud-app
   ```
6. Stop and remove the container:
   ```bash
   docker stop nodejs-cloud-app
   docker rm nodejs-cloud-app
   ```

### Running from Different Directories

The correct command depends on the current terminal location.

| Current directory | Correct command |
|-------------------|-----------------|
| Project root      | `node app/src/server.js` |
| `app/`            | `node src/server.js` or `npm start` |
| `app/src/`        | `node server.js` |

This is important because Node.js resolves file paths relative to the directory where the command is executed.

---

## Design Decisions

- Node.js and Express are used because they are simple, lightweight, and suitable for demonstrating application deployment.
- A `/health` endpoint is included to support future deployment validation and monitoring.
- The app listens on `0.0.0.0` so it can run correctly inside a Docker container.
- Port `3000` is used internally for the application.
- `package-lock.json` is committed so Docker and CI environments can install consistent dependency versions.
- The `Dockerfile` uses `npm ci --omit=dev` for a clean, reproducible production dependency install.
- In the final AWS deployment, port `3000` will not be publicly exposed. Public traffic will go through Nginx on port `80`.

---

## Security Notes

Current security considerations:

- No credentials are stored in the application code.
- No `.env` file should be committed.
- No AWS access keys should be committed.
- No private SSH keys should be committed.
- In the final AWS deployment, SSH access will be restricted to a trusted IP address only.
- The internal Node.js application port should not be exposed directly to the public internet.

---

## Cost Notes

At the current Day 2 stage, no AWS resources have been created yet, so there is no cloud cost.

Future cost considerations:

- EC2 may create AWS charges if left running.
- Use a small instance type for testing.
- Avoid NAT Gateway or Load Balancer in this project to keep costs low.
- Destroy infrastructure after testing using `terraform destroy`.

---

## Project Roadmap

| Day | Focus | Status |
|-----|-------|--------|
| Day 1 | Create local Express app | Complete |
| Day 2 | Dockerise the app | Complete |
| Day 3 | Add Terraform provider and variables | Complete |
| Day 4 | Add EC2 infrastructure and security group | Planned |
| Day 5 | Install Docker and configure Nginx reverse proxy | Planned |
| Day 6 | Deploy Docker container on EC2 | Planned |
| Day 7 | Documentation, screenshots, and cleanup | Planned |

---

## Day 1 Progress

### Completed

- Created basic Express server
- Added `/` route
- Added `/health` route
- Configured the app to listen on port `3000`
- Tested Node.js execution in GitHub Codespaces
- Identified and fixed path-related execution mistakes

### Issue encountered

- Error: Cannot find module

### Cause

- The app was executed from the wrong folder using an incorrect relative path.

### Fix

Use the correct command depending on the current folder:

- `project root` → `node app/src/server.js`
- `app/` → `node src/server.js`
- `app/src/` → `node server.js`

---

## Day 2 Progress

### Completed

- Installed Express as an application dependency
- Generated and committed `package-lock.json`
- Added a `Dockerfile`
- Added `.dockerignore`
- Built the Docker image locally
- Ran the Express app inside a Docker container
- Tested the container through `localhost:3000`

### Issue encountered

- `npm ci` can only install with an existing `package-lock.json`

### Cause

- The Dockerfile used `npm ci --omit=dev`, but `package-lock.json` had not been created yet.

### Fix

- Generated `package-lock.json` by installing Express properly:
  ```bash
  npm install express
  ```
- Then rebuilt the Docker image.

## Day 3 Progress

### Completed

- Created the `infra/` folder
- Added Terraform AWS provider configuration
- Added project variables
- Added example Terraform variable values
- Added initial Terraform outputs
- Ran `terraform init`
- Ran `terraform fmt`
- Ran `terraform validate`

### Issue encountered

- Terraform provider syntax needed correction.

### Fix

- Replaced incorrect provider syntax with valid Terraform `required_providers` and `provider "aws"` blocks.

---

## Testing

### Current local tests

```bash
curl http://localhost:3000
curl http://localhost:3000/health
```

### Docker tests

```bash
docker build -t nodejs-cloud-app .
docker run -d --name nodejs-cloud-app -p 3000:3000 nodejs-cloud-app
docker ps
curl http://localhost:3000
curl http://localhost:3000/health
docker logs nodejs-cloud-app
```

### Future deployment tests

```bash
curl http://EC2_PUBLIC_IP
curl http://EC2_PUBLIC_IP/health
```

---

## Screenshots

Screenshots will be added as the project progresses.

| Screenshot | File |
|------------|------|
| Local app running | `docs/screenshots/local-app-running.png` |
| Health endpoint test | `docs/screenshots/health-endpoint-test.png` |
| Docker build success | `docs/screenshots/docker-build.png` |
| Docker container running | `docs/screenshots/docker-ps.png` |
| Docker container logs | `docs/screenshots/docker-logs.png` |
| Terraform plan | `docs/screenshots/terraform-plan.png` |
| Terraform apply success | `docs/screenshots/terraform-apply-success.png` |
| EC2 instance running | `docs/screenshots/aws-ec2-instance.png` |
| Nginx reverse proxy test | `docs/screenshots/nginx-browser-test.png` |

---

## Cleanup

At the current stage, there are no AWS resources to clean up.

To remove the local Docker container:

```bash
docker stop nodejs-cloud-app
docker rm nodejs-cloud-app
```

To remove the local Docker image:

```bash
docker rmi nodejs-cloud-app
```

When Terraform infrastructure is added, cleanup will be performed using:

```bash
cd infra
terraform destroy
```

---

## Future Improvements

Possible future improvements:

- Add GitHub Actions for Docker build validation
- Add automated CI/CD deployment to EC2
- Add HTTPS using a domain and TLS certificate
- Push Docker image to Amazon ECR
- Deploy the container using ECS
- Add CloudWatch monitoring and alerts
- Add remote Terraform state using S3 and DynamoDB locking

---

## What I Learned

So far, I have practiced:

- Creating a basic Express application
- Adding application endpoints
- Creating a health-check route
- Running a Node.js app in GitHub Codespaces
- Understanding how Node.js resolves file paths
- Creating a Dockerfile
- Building a Docker image
- Running a Docker container locally
- Understanding why `package-lock.json` is needed for `npm ci`
- Preparing an app for future AWS EC2 deployment

---

## Project Summary

This project is being built incrementally as part of a cloud engineering portfolio.

The final goal is not only to run a Node.js app, but to demonstrate how application code, Docker containers, AWS infrastructure, Linux server configuration, Nginx reverse proxying, and Terraform automation fit together in a practical cloud deployment.