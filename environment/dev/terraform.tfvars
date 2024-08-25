project_name = "linuxtips-vpc"

region = "us-east-1"

public_subnets = {
  "linuxtips-vpc-public-subnet-1a" = {
    cidr_block        = "10.0.48.0/24"
    availability_zone = "us-east-1a"
  }
  "linuxtips-vpc-public-subnet-1b" = {
    cidr_block        = "10.0.49.0/24"
    availability_zone = "us-east-1b"
  }
  "linuxtips-vpc-public-subnet-1c" = {
    cidr_block        = "10.0.50.0/24"
    availability_zone = "us-east-1c"
  }
}

private_subnets = {
  "linuxtips-vpc-private-subnet-1a" = {
    cidr_block        = "10.0.0.0/20"
    availability_zone = "us-east-1a"
  }
  "linuxtips-vpc-private-subnet-1b" = {
    cidr_block        = "10.0.16.0/20"
    availability_zone = "us-east-1b"
  }
  "linuxtips-vpc-private-subnet-1c" = {
    cidr_block        = "10.0.32.0/20"
    availability_zone = "us-east-1c"
  }
}

database_subnets = {
  "linuxtips-vpc-databases_subnet-1a" = {
    cidr_block        = "10.0.51.0/24"
    availability_zone = "us-east-1a"
  }
  "linuxtips-vpc-databases_subnet-1b" = {
    cidr_block        = "10.0.52.0/24"
    availability_zone = "us-east-1b"
  }
  "linuxtips-vpc-databases_subnet-1c" = {
    cidr_block        = "10.0.53.0/24"
    availability_zone = "us-east-1c"
  }
}