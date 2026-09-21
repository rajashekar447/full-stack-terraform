terraform {
  backend "s3" {
    bucket       = "raja-full-stack-terraform-state-2026"
    key          = "full-stack/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
