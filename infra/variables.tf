variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "aws_profile" {
  description = "AWS CLI profile to use. Set to null when using default credentials."
  type        = string
  default     = null
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR IP range"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR IP address range"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "Allowed SSH CIDR IP address range"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
}

variable "app_port" {
  description = "Internal application port used by the Docker container"
  type        = number
  default     = 3000
}