# Specify the Terraform version and required providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }

  backend "s3" {
    bucket         = "sasiterraformbucket112233" # Replace with your S3 bucket name
    key            = "terraform/state/terraform.tfstate" # Path within the bucket
    region         = "ap-south-1" # Replace with your bucket's region
    dynamodb_table = "state-lock" # Replace with your DynamoDB table name for state locking
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-south-1"
}