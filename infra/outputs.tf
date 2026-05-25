output "project_name" {
  description = "Project name used for resource naming"
  value       = var.project_name
}

output "aws_region" {
  description = "AWS region selected for deployment"
  value       = var.aws_region
}

output "app_port" {
  description = "Internal application port used by the Node.js container"
  value       = var.app_port
}