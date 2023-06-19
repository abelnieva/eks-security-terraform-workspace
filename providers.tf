
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    http = "~> 2.0"
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.60"
    }
  }
}

provider "aws" {
  region = var.region
}
