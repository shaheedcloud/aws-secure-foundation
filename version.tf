terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


# Required_version makes sure your Terraform is new enough
# Locks the AWS provider to v5.x so behaviour is predicatable 
