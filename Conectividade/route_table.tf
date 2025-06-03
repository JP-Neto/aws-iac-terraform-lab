resource "aws_route_table" "routeTableDmz" {
  vpc_id = aws_vpc.vpc-east.id

  route {
    cidr_block = var.cidr_dmz
    gateway_id = aws_internet_gateway.igateway.id
  }


  tags = {
    Name = "Route_Dmz_Neto"
  }
}

resource "aws_route_table" "routeTableApp" {
  vpc_id = aws_vpc.vpc-east.id

  tags = {
    Name = "Route_App_Neto"
  }
}

resource "aws_route_table" "routeTableBd" {
  vpc_id = aws_vpc.vpc-east.id

  tags = {
    Name = "Route_Bd_Neto"
  }
}

resource "aws_route_table_association" "rtaDmz" {
  subnet_id      = aws_subnet.DMZ.id
  route_table_id = aws_route_table.routeTableDmz.id
}

resource "aws_route_table_association" "rtaApp" {
  subnet_id      = aws_subnet.APP.id
  route_table_id = aws_route_table.routeTableApp.id
}

resource "aws_route_table_association" "rtaBd" {
  subnet_id      = aws_subnet.BD.id
  route_table_id = aws_route_table.routeTableBd.id
}
