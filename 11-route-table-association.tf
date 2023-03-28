// and finaly we associate the route table with the subnet
resource "aws_route_table_association" "new_rtb_association" {
  count          = 2
  route_table_id = aws_route_table.new_route_table.id
  subnet_id      = aws_subnet.subnets.*.id[count.index]
}

// attention to the last line, there are two important concepts there:
// the count.index we have seen before, it is used when we are using the index from the current resource.data "
// because we are creating two associations, we are looping through them to create the subnet_id

// but now, look at the * in the subnets. Remember we created two subnets as well? This is how we iterate through other resources in a loop.
// we are adding all the subnets associated to the current rtb_association: all the subnets to the new_rtb_association_1 and all the subnets to the new_rtb_association_2