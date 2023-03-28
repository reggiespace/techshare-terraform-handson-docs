//lets now address the ami_id issue. We need to figure it out how to use a valid one.
// I am taking this problem to demonstrate we can create a file with any name and terraform will recognize it automatically

// I am creating an ubuntu.tf file and get a valid ami_id for an ubuntu machine. 

// ubuntu.tf in the project's root folder
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

// I got that on the terraform documentation. 

//lets use this ubuntu as the ami_id
module "techshare-vpc" {
  source         = "./modules/vpc"
  prefix         = var.prefix
  vpc_cidr_block = var.vpc_cidr_block
}

module "techshare-ec2" {
  source                 = "./modules/ec2"
  prefix                 = var.prefix
  instance_name          = "ec2-instance"
  instance_type          = var.instance_type
  ami_id                 = data.aws_ami.ubuntu.id
  subnet_id              = module.techshare-vpc.subnet_ids[1]
  vpc_security_group_ids = [module.techshare-vpc.security_group_id]
  allow_ssh_from         = var.vpc_cidr_block
}


// this is too much change, lets see if I haven't break anything. Remember we created a new module?
terraform init -upgrade

terraform plan