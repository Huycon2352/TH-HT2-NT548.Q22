variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
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
  description = "Availability zone for resources"
  type        = string
}

# VPC DNS Configuration
variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Enable DNS support in VPC"
  type        = bool
  default     = true
}

variable "map_public_ip_on_launch" {
  description = "Map public IP on launch for public subnet"
  type        = bool
  default     = true
}

# Security Group Configuration
variable "enable_all_egress" {
  description = "Allow all outbound traffic in security groups"
  type        = bool
  default     = true
}

variable "egress_cidr_blocks" {
  description = "CIDR blocks for egress traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# Network Configuration
variable "internet_route_cidr" {
  description = "CIDR block for internet routes"
  type        = string
  default     = "0.0.0.0/0"
}

# Resource Type Tags
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
