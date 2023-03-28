// lets create our main.tf file and start writing the code to create the VPC (Virtual Private Cloud)

resource "aws_vpc" "new_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "techshare-vpc"
  }
}

// I want to make it reusable, so lets create variables to fill the cidr_block and the tag name

// variables.tf
variable vpc_cidr_block {}
variable "prefix" {}

// and lets create the terraform.tfvars file to initialize these variables
//terraform.tfvars
prefix         = "techshare"
vpc_cidr_block = "10.0.0.0/16"

// and finally, lets refactor our main.tf file to use the variables
// the code will look like that
resource "aws_vpc" "new_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.prefix}-vpc"
  }
}

// we use var dot the name of the variable to inform terraform to use its content.
// see how we can concatenate variable and string? Looks like the template strings used in javascript