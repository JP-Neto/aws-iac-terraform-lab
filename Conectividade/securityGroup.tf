resource "aws_security_group" "sgDmz" {
  name        = "sgDmz"
  description = "Security Group DMZ"
  vpc_id      = aws_vpc.vpc-east.id

  tags = { Name = "Security-DMZ-Neto" }

}

resource "aws_security_group" "sgApp" {
  name        = "sgApp"
  description = "Security Group App"
  vpc_id      = aws_vpc.vpc-east.id

  tags = { Name = "Security-APP-Neto" }

}

resource "aws_security_group" "sgBd" {
  name        = "sgBD"
  description = "Security Group BD"
  vpc_id      = aws_vpc.vpc-east.id

  tags = { Name = "Security-BD-Neto" }

}

resource "aws_security_group" "sgAlb" {
  name        = "sgAlb"
  description = "Security Group sgAlb"
  vpc_id      = aws_vpc.vpc-east.id

  tags = { Name = "Security-sgAlb-Neto" }

}

#Regras de saida
#################################################################################
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_Dmz" {
  security_group_id = aws_security_group.sgDmz.id
  cidr_ipv4         = var.cidr_dmz
  ip_protocol       = "-1" # semantically equivalent to all ports

  tags = { Name = "Liberacao_trafego_DMZ" }
}
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_App" {
  security_group_id = aws_security_group.sgApp.id
  cidr_ipv4         = var.cidr_dmz
  ip_protocol       = "-1" # semantically equivalent to all ports

  tags = { Name = "Liberacao_trafego_App" }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_Bd" {
  security_group_id = aws_security_group.sgBd.id
  cidr_ipv4         = var.cidr_dmz
  ip_protocol       = "-1" # semantically equivalent to all ports

  tags = { Name = "Liberacao_trafego_Bd" }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_sgAlb" {
  security_group_id = aws_security_group.sgAlb.id
  cidr_ipv4         = var.cidr_dmz
  ip_protocol       = "-1" # semantically equivalent to all ports

  tags = { Name = "Liberacao_trafego_alb" }
}

resource "aws_vpc_security_group_ingress_rule" "allow_albApp" {
  security_group_id = aws_security_group.sgAlb.id
  cidr_ipv4         = var.subnetApp
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = { Name = "Liberacao ALB <=> APP" }
}



#Regras de entrada
#################################################################################

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_dmz" {
  security_group_id = aws_security_group.sgDmz.id
  cidr_ipv4         = var.cidr_dmz
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = { Name = "Liberacao SSH" }
}

resource "aws_vpc_security_group_ingress_rule" "allow_App_ssh" {
  security_group_id = aws_security_group.sgApp.id
  cidr_ipv4         = aws_subnet.DMZ.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = { Name = "Liberacao SSH" }
}


resource "aws_vpc_security_group_ingress_rule" "allow_App_RDP" {
  security_group_id = aws_security_group.sgApp.id
  cidr_ipv4         = aws_subnet.DMZ.cidr_block
  from_port         = 3389
  ip_protocol       = "tcp"
  to_port           = 3389

  tags = { Name = "Liberacao RDP" }
}


resource "aws_vpc_security_group_ingress_rule" "allow_BD_App" {
  security_group_id = aws_security_group.sgBd.id
  cidr_ipv4         = aws_subnet.APP.cidr_block
  from_port         = 12555
  ip_protocol       = "tcp"
  to_port           = 12555

  tags = { Name = "Liberacao BD - Srv APP" }
}

resource "aws_vpc_security_group_ingress_rule" "allow_sgAlb_AllTrafic" {
  security_group_id = aws_security_group.sgAlb.id
  cidr_ipv4         = var.cidr_dmz #0.0.0.0/0
  ip_protocol       = "-1"

  tags = { Name = "Liberacao sgAlb - All Trafic" }
}

resource "aws_vpc_security_group_ingress_rule" "allow_sgappAlb" {
  security_group_id = aws_security_group.sgApp.id
  cidr_ipv4         = var.cidr_dmz
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = { Name = "Liberacao sgAlb - All Trafic" }
}


