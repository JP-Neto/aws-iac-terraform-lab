resource "aws_instance" "windowns-ec2-neto" {
  ami                    = var.ami-win
  availability_zone      = var.azs[1] #Precisa melhorar
  instance_type          = var.instance_type
  key_name               = var.aws-key
  subnet_id              = var.subnetPrivateIds[0]    #Precisa melhorar Subnet APP
  vpc_security_group_ids = [var.segGroupPrivateId[0]] #Precisa melhorar Subnet APP

  tags = { Name = "Ec2 Windowns - Neto - Rdp" }

}


