# EC2 Module - Creates Public and Private EC2 instances

# Public EC2 Instance
resource "aws_instance" "public" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.public_sg.id]

  tags = {
    Name        = "${var.project_name}-public-ec2"
    Environment = var.environment
    Type        = var.public_instance_type
  }
}

# Private EC2 Instance
resource "aws_instance" "private" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [aws_security_group.private_sg.id]

  tags = {
    Name        = "${var.project_name}-private-ec2"
    Environment = var.environment
    Type        = var.private_instance_type
  }
}

# Public EC2 Security Group
resource "aws_security_group" "public_sg" {
  name        = "${var.project_name}-public-ec2-sg"
  description = var.public_sg_description
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.ssh_protocol
    cidr_blocks = var.ssh_source_cidr
    description = var.public_sg_ssh_description
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
    description = var.public_sg_egress_description
  }

  tags = {
    Name        = "${var.project_name}-public-ec2-sg"
    Environment = var.environment
  }
}

# Private EC2 Security Group
resource "aws_security_group" "private_sg" {
  name        = "${var.project_name}-private-ec2-sg"
  description = var.private_sg_description
  vpc_id      = var.vpc_id

  ingress {
    from_port       = var.ssh_port
    to_port         = var.ssh_port
    protocol        = var.ssh_protocol
    security_groups = [aws_security_group.public_sg.id]
    description     = var.private_sg_ssh_description
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
    description = var.private_sg_egress_description
  }

  tags = {
    Name        = "${var.project_name}-private-ec2-sg"
    Environment = var.environment
  }
}
