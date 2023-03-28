// on the project's root folder, lets create an output.tf file and exports a file to our local drive 

locals {
  content = <<-EOT
    instance_id = ${module.techshare-ec2.ec2_instance_id}
    public_ip = ${module.techshare-ec2.instance_public_ip}
    private_ip = ${module.techshare-ec2.instance_private_ip}
    availability_zone = ${join(",", module.techshare-vpc.za)}
  EOT
}

resource "local_file" "resource_info" {
  filename = "resource_info.txt"
  content  = local.content
}

// I am taking a shourtcut now because we have seen that before. 
// I know I want to print in the file some data from the ec2 instance, so I am accessing them, but they are not being exported yet
// lets do it now. 

// create an outputs.tf file inside the ec2 folder and add the following content to it
output "instance_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}

output "instance_private_ip" {
  value = aws_instance.ec2_instance.private_ip
}

output "ec2_instance_id" {
  value = aws_instance.ec2_instance.id
}

// more
// we need to export the availability zone from the VPC as well
// outputs.tf inside the VPC folder
output "za" {
  value = data.aws_availability_zones.available.names
}