
# data "aws_ami" "AMI" {
#   most_recent = true

#   filter {
#     name   = "platform"
#     values = ["AmazonLinux2*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["amazon"] # Canonical
# }

resource "aws_instance" "bastion" {
  ami           = "ami-0636eac5d73e0e5d7"
  instance_type = "t2.micro"
    monitoring             = true
    associate_public_ip_address= true
    vpc_security_group_ids = [module.Network.public_security]
    subnet_id = module.Network.pulic_subnet

}

resource "aws_ec2_tag" "bastion_Tag" {
  resource_id = aws_instance.bastion.id
  key         = "Name"
  value       = "bastion"
}

# resource "aws_instance" "terraformInstance2" {
#   ami           = "ami-0ddab716196087271"
#   instance_type = "t2.micro"

#   network_interface {
#     network_interface_id = module.Network.network_interface.terraformNetwork2.id
#     device_index         = 0
#   }



# }



# resource "aws_ec2_tag" "terraformInstance2Tag" {
#   resource_id = aws_instance.terraformInstance2.id
#   key         = "Name"
#   value       = "terraformInstance2"
# }
