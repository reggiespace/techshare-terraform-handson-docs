// moving forward, lets create two subnets.data 

// I am creating two because at the end of my last presentation, one of the questions was how to address to multiple resources of the same type
// If you also think that this is helpful for you too, please like and subscribe

resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.new_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.prefix}-subnet-1"
  }
}

// and if we want another subnet, here we go
resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.new_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.prefix}-subnet-1"
  }
}

// lets plan and see if it works
terraform plan