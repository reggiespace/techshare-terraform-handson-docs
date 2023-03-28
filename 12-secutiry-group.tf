// to finish the VPC, lets create a security group that will be used by the EC2 later
resource "aws_security_group" "new_sg" {
  name_prefix = var.prefix

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

// In this case I am creating only the ingress port, not egress

terraform plan 


// and that is it for the VPC