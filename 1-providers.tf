// lets start writing the providers.tf, to organize all the providers we will be using in a single place.

// lets declare the required version of terraform and the aws provider we will be using.

terraform {
  required_version = ">=0.13.1"
  required_providers {
    aws   = ">=3.54.0"
  }
}

provider "aws" {
  region = "us-east-1"
}


// I will add one more provider at the end of this demo, if time permits.