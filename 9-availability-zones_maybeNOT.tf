// out of curiosity, if you want to access data from a resource we do not create, we can use the data keyword 
data "aws_availability_zones" "available" {
  state = "available"
}

// this returns a list with all available availability zones. 
// we can then attach this to our vpcs like so:

resource "aws_subnet" "subnets" {
  count                   = 2
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  vpc_id                  = aws_vpc.new_vpc.id
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.prefix}-subnet-${count.index}"
  }
}

// remember that I mention that this retuns a list? In this weird code created just for demo the data keywork, I am attaching one availabiity zone to each subnet. 