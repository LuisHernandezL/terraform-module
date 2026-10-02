terraform {
  required_version = "1.16.4"

  cloud {
    organization = "personal-demo-free"

    workspaces {
      name = "terraform-module"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# VCS-driven workspace: every merge to main triggers a run on HCP Terraform.
# AWS credentials come from the "aws-cuenta-personal-demo" variable set.
provider "aws" {
  region = var.aws_region
}
