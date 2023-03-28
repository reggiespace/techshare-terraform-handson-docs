// next we create the internet gateway
resource "aws_internet_gateway" "new_igw" {
  vpc_id = aws_vpc.new_vpc.id
  tags = {
    Name = "${var.prefix}-igw"
  }
}

// always plan after adding a new resource and commit if the result is fine

// we can then create a route table
resource "aws_route_table" "new_route_table" {
  vpc_id = aws_vpc.new_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.new_igw.id
  }
  tags = {
    Name = "${var.prefix}-rtb"
  }
}

// attention to the gateway_id, we are refering to the internet gateway we created on the previous step

