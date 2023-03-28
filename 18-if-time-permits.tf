// I want to show you that we can save content into our file system, using the local provider.
// Lets add another provider in the providers.tf file.

terraform {
  required_version = ">=0.13.1"
  required_providers {
    aws   = ">=3.54.0"
    local = ">=2.1.0"
  }
  backend "s3" {
    bucket = "techshare-terraform"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}



