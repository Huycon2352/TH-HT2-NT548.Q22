# Terraform Backend Configuration for State Management
# Uncomment after running bootstrap to enable remote state storage

terraform {
  backend "s3" {
    bucket         = "project-ht2-terraform-nt548-q22"
    key            = "dev/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "project-ht2-terraform-nt548-q22-lock"
    encrypt        = true
  }
}

# Note: For local development, comment out the backend block above
# and use: terraform init
# To migrate to remote state after bootstrap: terraform init -migrate-state
