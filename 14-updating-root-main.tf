// lets then use this module in our main.tf file in the project's root folder

module "techshare-ec2" {
  source                 = "./modules/ec2"
  prefix                 = var.prefix
  instance_name          = "ec2-instance"
  instance_type          = var.instance_type
  ami_id                 = "??"
  subnet_id              = "this is from the vpc module"
  vpc_security_group_ids = "this is from the vpc module"
  allow_ssh_from         = var.vpc_cidr_block
}

// a couple of things to highlight here
// first, the instance_name. It is hardcoded to show we can init variables here too

// second there are two variables whose values came from the VPC module, so we need to address it before plan or terraform will complain
// finally, we need to provide a valid ami_id, how to do that?

// lets first address the variables that came from the modules