// I want to publish this code into github to work in a team, so let me create a bucket to store the terraform.tfstate

// this way, we can share the state and avoid one developer to overwrite (and potentially destroy) a resource created for another dev.
// this is the remote state Andy mentioned during the Q&A session last week

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


// Terraform will NOT create this bucket, we need to create ahead of time.