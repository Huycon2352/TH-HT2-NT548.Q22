# Main Terraform configuration for dev environment
# Orchestrates all modules

# VPC Module
module "vpc" {
  source = "../../modules/vpc"

  project_name              = var.project_name
  environment               = var.environment
  vpc_cidr                  = var.vpc_cidr
  public_subnet_cidr        = var.public_subnet_cidr
  private_subnet_cidr       = var.private_subnet_cidr
  availability_zone         = var.availability_zone
  enable_dns_hostnames      = var.enable_dns_hostnames
  enable_dns_support        = var.enable_dns_support
  map_public_ip_on_launch   = var.map_public_ip_on_launch
  internet_route_cidr       = var.internet_route_cidr
  egress_cidr_blocks        = var.egress_cidr_blocks
  public_subnet_type        = var.public_subnet_type
  private_subnet_type       = var.private_subnet_type
  nat_eip_domain            = var.nat_eip_domain
  vpc_default_sg_description   = var.vpc_default_sg_description
  vpc_ingress_description   = var.vpc_ingress_description
  vpc_egress_description    = var.vpc_egress_description
}

# EC2 Module
module "ec2" {
  source = "../../modules/ec2"

  project_name                 = var.project_name
  environment                  = var.environment
  vpc_id                       = module.vpc.vpc_id
  public_subnet_id             = module.vpc.public_subnet_id
  private_subnet_id            = module.vpc.private_subnet_id
  ami_id                       = var.ami_id
  instance_type                = var.instance_type
  key_name                     = var.key_name
  ssh_source_cidr              = var.ssh_source_cidr
  ssh_port                     = var.ssh_port
  ssh_protocol                 = var.ssh_protocol
  egress_from_port             = var.egress_from_port
  egress_to_port               = var.egress_to_port
  egress_protocol              = var.egress_protocol
  egress_cidr_blocks           = var.egress_cidr_blocks
  public_instance_type         = var.public_instance_type
  private_instance_type        = var.private_instance_type
  public_sg_description        = var.public_sg_description
  public_sg_ssh_description    = var.public_sg_ssh_description
  public_sg_egress_description = var.public_sg_egress_description
  private_sg_description       = var.private_sg_description
  private_sg_ssh_description   = var.private_sg_ssh_description
  private_sg_egress_description = var.private_sg_egress_description
}
