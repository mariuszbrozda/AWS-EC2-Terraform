
terraform {
  # Terraform version constrain
  required_version = ">= 1.4.6"

  # Terraform providers
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.34.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  # Configuration options
  profile = var.profile
  region  = var.region

  default_tags {
    tags = {
      Environment = "Development"
      Provisioner = "Terraform"
    }
  }
}