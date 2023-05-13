
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    http = "~> 1.2"
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.60"
    }
  }
}

provider "aws" {
  region = var.region
}