terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.70.0"
    }
  }
  backend "s3" {
    bucket = "remote-backend-asn-cvrbf-pfamf"
    key    = "dev/terraform.tfstate"
    region = "ca-central-1"
  }
}

provider "aws" {
  region = "ca-central-1"
}