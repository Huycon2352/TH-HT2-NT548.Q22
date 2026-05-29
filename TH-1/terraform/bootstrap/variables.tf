variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "state_bucket_name" {
  description = "S3 bucket name for Terraform state"
  type        = string
}

variable "state_lock_table_name" {
  description = "DynamoDB table name for Terraform state lock"
  type        = string
}
