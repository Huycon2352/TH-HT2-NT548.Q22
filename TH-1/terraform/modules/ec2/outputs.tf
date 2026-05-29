output "public_instance_id" {
  description = "Public EC2 instance ID"
  value       = aws_instance.public.id
}

output "public_instance_private_ip" {
  description = "Private IP of public EC2 instance"
  value       = aws_instance.public.private_ip
}

output "public_instance_public_ip" {
  description = "Public IP of public EC2 instance"
  value       = aws_instance.public.public_ip
}

output "private_instance_id" {
  description = "Private EC2 instance ID"
  value       = aws_instance.private.id
}

output "private_instance_private_ip" {
  description = "Private IP of private EC2 instance"
  value       = aws_instance.private.private_ip
}

output "public_sg_id" {
  description = "Security group ID for public EC2"
  value       = aws_security_group.public_sg.id
}

output "private_sg_id" {
  description = "Security group ID for private EC2"
  value       = aws_security_group.private_sg.id
}
