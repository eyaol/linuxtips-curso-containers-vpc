#
# Store VPC ID in parameter store
#
resource "aws_ssm_parameter" "vpc" {
  name  = format("/%s/vpc/vpc_id", var.project_name)
  type  = "String"
  value = aws_vpc.main.id
}

#
# Store private subnets ID in parameter store
#
resource "aws_ssm_parameter" "private_subnets" {
  for_each = aws_subnet.private_subnets
  name     = format("/%s/vpc/%s", var.project_name, each.key)
  type     = "String"
  value    = each.value.id
}

#
# Store public subnets ID in parameter store
#
resource "aws_ssm_parameter" "public_subnets" {
  for_each = aws_subnet.public_subnets
  name     = format("/%s/vpc/%s", var.project_name, each.key)
  type     = "String"
  value    = each.value.id
}

#
# Store database subnets ID in parameter store
#
resource "aws_ssm_parameter" "database_subnets" {
  for_each = aws_subnet.database_subnets
  name     = format("/%s/vpc/%s", var.project_name, each.key)
  type     = "String"
  value    = each.value.id
}