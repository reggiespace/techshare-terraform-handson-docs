// how to get data from a module and use it in another module? exporting the values we want
// how to export the values we want? creating an output. lets organize our outputs in a file called outputs.tf 

//outputs.tf inside vpc folder
output "subnet_ids" {
  value = aws_subnet.subnets[*].id
}

output "security_group_id" {
  value = aws_security_group.new_sg.id
}

// I am exporting a list of subnet ids and naming the output as subnet_ids
// the same for the security group id