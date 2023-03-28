// back to the main.tf, lets update the variables with the module outputs

module "techshare-ec2" {
  source                 = "./modules/ec2"
  prefix                 = var.prefix
  instance_name          = "ec2-instance"
  instance_type          = var.instance_type
  ami_id                 = "??"
  subnet_id              = module.techshare-vpc.subnet_ids[0]
  vpc_security_group_ids = [module.techshare-vpc.security_group_id]
}

// again, two things to highlight here
// first, the ec2 instance only need one subnet_id, but since we are exporting multiple, I am arbitrarely using the first one. It is not best practice, I just
// want to show that we can use the array notation here.

// then I am doing exactly the opposite in the secutiry group. Instead of use the key vpc_security_group_id (singular), I am using the vpc_security_group_ids (plural)
// that expects a list of ids, and since we are exporting only one, I am adding it to an array

// this code would not pass a code review, but who cares? This is only a presentation.
