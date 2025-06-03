resource "aws_vpc" "vpc-east" {
  cidr_block = var.vpcPrincipal

  tags = { Name = "Vpc-Neto-terraform" }
}
