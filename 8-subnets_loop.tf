// what happens if we need to create dozens of the same resource? copy and paste is not clean, so there is another way to achive the same result:
resource "aws_subnet" "subnets" {
  count                   = 2
  vpc_id                  = aws_vpc.new_vpc.id
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.prefix}-subnet-${count.index}"
  }
}

// you see the count equals to 2? Terraform will create two of this resources
// then we can use count.index inside the same resource to reference to each one. 
// Does the array begins with zero or one? Ask me in the Q&A session at the end of this presentation. If you are watching the record, please, don't fast forward the video. 

// planning the changes to see what happens
terraform plan 

