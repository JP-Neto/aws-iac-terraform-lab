resource "aws_internet_gateway" "igateway" {
  vpc_id = aws_vpc.vpc-east.id

  tags = { Name = "Internet_gateway_Neto" }

}

#Elastic IP e o natGateway
resource "aws_eip" "eipNat" {
  #vpc = true
  tags = { Name = "elastic IP natgateway" }
}

resource "aws_nat_gateway" "ngty-neto" {
  allocation_id = aws_eip.eipNat.id
  subnet_id     = aws_subnet.DMZ.id
  tags          = { Name = "nat-gateway-neto" }
}

resource "aws_route" "nat_gateway_app" {
  route_table_id         = aws_route_table.routeTableApp.id
  destination_cidr_block = var.cidr_dmz
  nat_gateway_id         = aws_nat_gateway.ngty-neto.id
}

resource "aws_route" "nat_gateway_bd" {
  route_table_id         = aws_route_table.routeTableBd.id
  destination_cidr_block = var.cidr_dmz
  nat_gateway_id         = aws_nat_gateway.ngty-neto.id
}

