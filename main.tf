module "Network" {
  source      = "/home/ahmed/Desktop/DevOps/Terraform/Network"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  # region=var.region
}