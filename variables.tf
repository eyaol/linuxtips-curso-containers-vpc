#
# Project Name
# 
variable "project_name" {
  type = string
}

#
# Region
# 
variable "region" {
  type = string
}

#
# Availability zones
#
variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

#
# Public subnets
# 
variable "public_subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}

#
# Private subnets
#
variable "private_subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}

#
# Database subnets
#
variable "database_subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}

