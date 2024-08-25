#
# Create Elastic IPs
#
resource "aws_eip" "vpc_eip" {
  for_each = toset(var.availability_zones)

  domain = "vpc"

  tags = {
    Name = format("%s-eip-%s", var.project_name, each.key)
  }
}

#
# Create Nat Gateways
#
resource "aws_nat_gateway" "nat_gateways" {
  for_each = toset(var.availability_zones)

  allocation_id = aws_eip.vpc_eip[each.key].id

  subnet_id = lookup(
    { for subnet in aws_subnet.public_subnets : subnet.availability_zone => subnet.id }, each.key
  )

  tags = {
    Name = format("%s-nat-gtw-%s", var.project_name, each.key)
  }

  depends_on = [
    aws_subnet.public_subnets,
    aws_eip.vpc_eip
  ]
}