resource "aws_subnet" "DMZ" {

  availability_zone = var.azs[0]
  cidr_block        = var.subnetDmz
  vpc_id            = aws_vpc.vpc-east.id

  tags = { Name = "Subnet-DMZ-neto" }
}

