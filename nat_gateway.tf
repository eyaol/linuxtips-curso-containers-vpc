#
# Create Elastic IP
#
resource "aws_eip" "vpc_eip" {
  for_each = toset(var.availability_zones)

  domain = "vpc"

  tags = {
    Name = format("%s-eip-%s", var.project_name, each.key)
  }
}

#
# Create Nat Gateway
#
resource "aws_nat_gateway" "nat_gateways" {
  for_each = aws_eip.vpc_eip

  allocation_id = each.value.id

  subnet_id = lookup(
    { for s in aws_subnet.public_subnets : s.availability_zone => s.id }, 
  each.key)
  
  tags = {
    Name = format("%s-nat-gtw-%s", var.project_name, each.key)
  }

  depends_on = [
    aws_subnet.public_subnets,
    aws_eip.vpc_eip
  ]
}