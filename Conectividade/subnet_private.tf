resource "aws_subnet" "APP" {
  availability_zone = var.azs[1]
  cidr_block        = var.subnetApp
  vpc_id            = aws_vpc.vpc-east.id
  tags              = { Name = "Subnet-APP-neto" }

}

resource "aws_subnet" "BD" {
  availability_zone = var.azs[2]
  cidr_block        = var.subnetBd
  vpc_id            = aws_vpc.vpc-east.id
  tags              = { Name = "Subnet-BD-neto" }

}