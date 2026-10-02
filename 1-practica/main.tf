terraform {
  required_version = "1.16.4"

  cloud {

    organization = "personal-demo-free"

    workspaces {
      name = "default-project"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Runs on HCP Terraform remote runners: credentials come from the workspace
# environment variables AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY, not from a local profile.
provider "aws" {
  region = var.aws_region
}
