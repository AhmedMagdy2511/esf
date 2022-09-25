resource "aws_subnet" "terraformSubnet1" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = "${var.subnet_cidr}1.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "terraformSubnet1"
  }
}
resource "aws_subnet" "terraformSubnet2" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = "${var.subnet_cidr}2.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "terraformSubnet2"
  }
}

resource "aws_subnet" "terraformSubnet1Private" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = "${var.subnet_cidr}3.0/24"

  tags = {
    Name = "terraformSubnet1Private"
  }
}
resource "aws_subnet" "terraformSubnet2Private" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = "${var.subnet_cidr}4.0/24"

  tags = {
    Name = "terraformSubnet2Private"
  }
}
