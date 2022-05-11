# Terraform version
terraform {
  required_version = ">= 0.14.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.1.15"
    }
  }
}