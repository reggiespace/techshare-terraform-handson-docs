// before going to much far, lets change it to a module.
// I want to be able to reuse the vpc and the ec2 we will create later, so lets refactor the code a little bit now.data "

// 1. create a folder called modules
// I can give this folder any name, but since I am using to organize my modules, I am naming it modules.

// 2 inside this folder, let me createa another folder, called vpc.
// again, it could be any name, but I want to store all the instructions need to create a VPC in AWS 

// 3. Inside the VPC folder, I am MOVING two files we have created: main.tf and variables.tf 
// they are specific for the vpc, so I am moving instead of creating them again

// 4. Now, I need to create a main.tf in the root folder, to instanciate our modules. Lets do it now:
// main.tf
module "techshare-vpc" {
  source         = "./modules/vpc"
  prefix         = var.prefix
  vpc_cidr_block = var.vpc_cidr_block
}

// 5. I need a variables.tf in the root as well to pass the content to the module
// variables.tf 
variable "prefix" {}
variable "vpc_cidr_block" {}

// Show both variables.tf files and explain that they look the same, but the internal file is to store the module variables we are passing on the "module" definition.data "
// we don't need a terraform.tfvars for a module, we only create this file in the project's root folder