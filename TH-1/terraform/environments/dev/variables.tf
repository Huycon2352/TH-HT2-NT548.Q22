# Environment variables for dev - these values are passed from terraform.tfvars

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "key_name" {
  description = "EC2 Key Pair name for SSH access"
  type        = string
}

variable "ssh_source_cidr" {
  description = "CIDR blocks allowed for SSH"
  type        = list(string)
}

# VPC DNS Configuration
variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in VPC"
  type        = bool
}

variable "enable_dns_support" {
  description = "Enable DNS support in VPC"
  type        = bool
}

variable "map_public_ip_on_launch" {
  description = "Map public IP on launch for public subnet"
  type        = bool
}

# Network Configuration
variable "internet_route_cidr" {
  description = "CIDR block for internet routes (0.0.0.0/0)"
  type        = string
}

variable "enable_all_egress" {
  description = "Allow all outbound traffic in security groups"
  type        = bool
}

variable "egress_cidr_blocks" {
  description = "CIDR blocks for all egress traffic"
  type        = list(string)
}

# EC2 Security Configuration
variable "ssh_port" {
  description = "SSH port number"
  type        = number
}

variable "ssh_protocol" {
  description = "Protocol for SSH"
  type        = string
}

variable "egress_from_port" {
  description = "Starting port for egress traffic"
  type        = number
}

variable "egress_to_port" {
  description = "Ending port for egress traffic"
  type        = number
}

variable "egress_protocol" {
  description = "Protocol for egress traffic"
  type        = string
}

# VPC Resource Type Tags
variable "public_subnet_type" {
  description = "Type tag for public subnet"
  type        = string
  default     = "Public"
}

variable "private_subnet_type" {
  description = "Type tag for private subnet"
  type        = string
  default     = "Private"
}

# NAT Gateway Configuration
variable "nat_eip_domain" {
  description = "Domain for NAT Gateway Elastic IP"
  type        = string
  default     = "vpc"
}

# Security Group Descriptions (VPC)
variable "vpc_default_sg_description" {
  description = "Description for default VPC security group"
  type        = string
  default     = "Default security group for VPC"
}

variable "vpc_ingress_description" {
  description = "Description for VPC default security group ingress rule"
  type        = string
  default     = "Allow all traffic within VPC"
}

variable "vpc_egress_description" {
  description = "Description for VPC security group egress rule"
  type        = string
  default     = "Allow all outbound traffic"
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

# Security Group Descriptions (EC2)
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
