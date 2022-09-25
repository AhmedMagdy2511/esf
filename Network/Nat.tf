# resource "aws_eip" "Elasticip1" {
  
#   vpc   = true
# }
# resource "aws_eip" "Elasticip2" {
#   instance = aws_instance.web.id
#   vpc      = true
# }

# resource "aws_nat_gateway" "terraformNat1" {
#   allocation_id = aws_eip.Elasticip1.id
#   subnet_id     = aws_subnet.terraformSubnet1.id

#   tags = {
#     Name = "terraformNat1"
#   }
# }
# resource "aws_nat_gateway" "terraformNat2" {
#   allocation_id = aws_eip.Elasticip.id
#   subnet_id     = aws_subnet.terraformSubnet2.id

#   tags = {
#     Name = "terraformNat2"
#   }


# }