variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID"
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 Key Pair name for SSH access"
  type        = string
}

variable "ssh_source_cidr" {
  description = "CIDR blocks allowed for SSH access to public EC2"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# SSH Security Configuration
variable "ssh_port" {
  description = "SSH port number"
  type        = number
  default     = 22
}

variable "ssh_protocol" {
  description = "Protocol for SSH (tcp or udp)"
  type        = string
  default     = "tcp"
}

# Egress Security Configuration
variable "egress_from_port" {
  description = "Starting port for egress traffic (0 = all)"
  type        = number
  default     = 0
}

variable "egress_to_port" {
  description = "Ending port for egress traffic (0 = all)"
  type        = number
  default     = 0
}

variable "egress_protocol" {
  description = "Protocol for egress traffic (-1 = all)"
  type        = string
  default     = "-1"
}

variable "egress_cidr_blocks" {
  description = "CIDR blocks for egress traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# EC2 Instance Type Tags
variable "public_instance_type" {
  description = "Type tag for public EC2 instance"
  type        = string
  default     = "Public"
}

variable "private_instance_type" {
  description = "Type tag for private EC2 instance"
  type        = string
  default     = "Private"
}

# Security Group Descriptions
variable "public_sg_description" {
  description = "Description for public EC2 security group"
  type        = string
  default     = "Security group for public EC2 instance"
}

variable "public_sg_ssh_description" {
  description = "Description for public EC2 SSH ingress rule"
  type        = string
  default     = "SSH access"
}

variable "public_sg_egress_description" {
  description = "Description for public EC2 egress rule"
  type        = string
  default     = "Allow all outbound traffic"
}

variable "private_sg_description" {
  description = "Description for private EC2 security group"
  type        = string
  default     = "Security group for private EC2 instance"
}

variable "private_sg_ssh_description" {
  description = "Description for private EC2 SSH from public ingress rule"
  type        = string
  default     = "SSH from public EC2 instance"
}

variable "private_sg_egress_description" {
  description = "Description for private EC2 egress rule"
  type        = string
  default     = "Allow all outbound traffic"
}
