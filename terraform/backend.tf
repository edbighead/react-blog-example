# Provider configuration for lambda@edge
provider "aws" {
  region = "us-east-1"
  version = "~> 2.0"
}

terraform {
  backend "s3" {
    key    = "tfstate"
    region = "us-east-1"
  }
}