resource "aws_subnet" "databases_subnet_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.51.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = format("%s-databases_subnet-1a", var.nome_projeto)
  }
}

resource "aws_subnet" "databases_subnet_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.52.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = format("%s-databases_subnet-1b", var.nome_projeto)
  }
}

resource "aws_subnet" "databases_subnet_1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.53.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = format("%s-databases_subnet-1c", var.nome_projeto)
  }
}