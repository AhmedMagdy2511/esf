resource "aws_vpc" "terraform" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "terraform"
  }
}


# resource "aws_network_interface" "terraformNetwork1" {
#   subnet_id   = aws_subnet.terraformSubnet1.id
  

#   tags = {
#     Name = "primary_network_interface1"
#   }
# }
# resource "aws_network_interface" "terraformNetwork2" {
#   subnet_id   = aws_subnet.terraformSubnet2.id
  

#   tags = {
#     Name = "primary_network_interface2"
#   }
# }

resource "aws_internet_gateway" "terraformGateWay" {
  vpc_id = aws_vpc.terraform.id

  tags = {
    Name = "terraformGateWay"
  }
}