

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.linux.id
  instance_type               = "t2.micro"
  monitoring                  = true
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.Network.public_security]
  subnet_id                   = module.Network.pulic_subnet

}

resource "aws_ec2_tag" "bastion_Tag" {
  resource_id = aws_instance.bastion.id
  key         = "Name"
  value       = "bastion"
}

resource "aws_instance" "application" {
  ami                         = data.aws_ami.linux.id
  instance_type               = "t2.micro"
  monitoring                  = true
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.Network.private_security]
  subnet_id                   = module.Network.private_subnet
}



resource "aws_ec2_tag" "applicationTag" {
  resource_id = aws_instance.application.id
  key         = "Name"
  value       = "application"
}
