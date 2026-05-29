# Outputs from dev environment

# VPC Outputs
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = module.vpc.private_subnet_id
}

output "nat_gateway_eip" {
  description = "Elastic IP of NAT Gateway"
  value       = module.vpc.nat_eip
}

# EC2 Outputs
output "public_instance_id" {
  description = "Public EC2 instance ID"
  value       = module.ec2.public_instance_id
}

output "public_instance_public_ip" {
  description = "Public IP address of public EC2"
  value       = module.ec2.public_instance_public_ip
}

output "public_instance_private_ip" {
  description = "Private IP address of public EC2"
  value       = module.ec2.public_instance_private_ip
}

output "private_instance_id" {
  description = "Private EC2 instance ID"
  value       = module.ec2.private_instance_id
}

output "private_instance_private_ip" {
  description = "Private IP address of private EC2"
  value       = module.ec2.private_instance_private_ip
}

# Security Groups
output "public_sg_id" {
  description = "Security group for public EC2"
  value       = module.ec2.public_sg_id
}

output "private_sg_id" {
  description = "Security group for private EC2"
  value       = module.ec2.private_sg_id
}
