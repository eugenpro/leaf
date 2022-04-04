# Define Local Values in Terraform
locals {
  owners = var.team
  environment = var.environment
  name = "${var.team}-${var.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
} 