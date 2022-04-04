# Terraform Block
terraform {
  required_version = "~> 1.0" 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "terraform-state-prod"
    key    = "network/terraform.tfstate"
    region = "us-east-1" 

  }    
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
}