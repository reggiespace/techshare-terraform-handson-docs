// lets now create the aws ec2 instance, but lets create it as a module
// first, create a folder and name it the way you want. I will use ec2
// inside this folder, lets create a file called main.tf 

resource "aws_instance" "ec2_instance" {
  ami                    = ""
  instance_type          = "t3.micro"
  subnet_id              = ""
  vpc_security_group_ids = ""

  tags = {
    Name = "${var.prefix}-${var.instance_name}-ecw"
  }
}

// as you can imagine, we have a couple of variables to create. 
// first, I want to highlight that we can concatenate multiple variables using that template string like approach
// and second, The subnet_id and vpc_security_group_ids are the ones we created in the vpc module, but here in the ec2 module, they are just variables like any other
// to address them, lets create a variables.tf file and declare these variables 

//variables.tf
variable "instance_type" {}
variable "instance_name" {}
variable "subnet_id" {}
variable "vpc_security_group_ids" {}
variable "prefix" {}

// the final code looks like this
resource "aws_instance" "ec2_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = "${var.prefix}-${var.instance_name}-ecw"
  }
}
