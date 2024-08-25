#
# Create public subnets
#
resource "aws_subnet" "public_subnets" {
  for_each = var.public_subnets

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = "${each.key}"
  }
}

#
# Create route table
#
resource "aws_route_table" "public_internet_access" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = format("%s-public", var.project_name)
  }

}

#
# Create routes
#
resource "aws_route" "public_access" {
  route_table_id         = aws_route_table.public_internet_access.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

#
# Create public subnets route table association
#
resource "aws_route_table_association" "public" {
  for_each = toset(var.availability_zones)

  subnet_id = lookup(
    { for subnet in aws_subnet.public_subnets : subnet.availability_zone => subnet.id }, each.key
  )

  route_table_id = aws_route_table.public_internet_access.id
}