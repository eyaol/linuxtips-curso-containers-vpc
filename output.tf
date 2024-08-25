output "ssm_vpc_id" {
  value = aws_ssm_parameter.vpc.id
}

output "ssm_private_subnets" {
  value = {
    for subnet_key, param in aws_ssm_parameter.private_subnets : subnet_key => param.id
  }
}

output "ssm_public_subnets" {
  value = {
    for subnet_key, param in aws_ssm_parameter.public_subnets : subnet_key => param.id
  }
}

output "ssm_database_subnets" {
  value = {
    for subnet_key, param in aws_ssm_parameter.database_subnets : subnet_key => param.id
  }
}

output "elastic_ips" {
  value = aws_eip.vpc_eip
}

output "nat_gateways" {
  value = aws_nat_gateway.nat_gateways
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_route_table" {
  value = aws_route_table.public_internet_access
}

output "private_route_table" {
  value = aws_route_table.private_internet_access
}