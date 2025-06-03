resource "aws_instance" "ec2_linux_public" {
  availability_zone           = var.azs[0] #Precisa melhorar
  ami                         = var.ami-linux
  instance_type               = var.instance_type
  key_name                    = var.aws-key
  subnet_id                   = var.subnetPublicId
  vpc_security_group_ids      = [var.segGroupPublicId]
  associate_public_ip_address = true

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >>private_ip.txt"

  }
  tags = { Name = "Ec2 Linux - Public - DMZ" }

}

resource "aws_instance" "ec2_linux_az_1_neto" {
  count             = var.instances_count
  availability_zone = var.azs[1] #não é a melhor forma Precisa melhorar
  ami               = var.ami-linux
  instance_type     = var.instance_type
  key_name          = var.aws-key
  subnet_id         = var.subnetPrivateIds[0]
  security_groups   = [var.segGroupPrivateId[0]]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apache2
              systemctl start apache2
              systemctl enable apache2
              echo "<html>
              <head>
              <title>Instance in AZ</title>
              <style>
              body { font-family: Arial, sans-serif; background-color: #f0f0f0; margin: 40px; }
              h1 { color: #333; }
              p { color: #666; }
              </style>
              </head>
              <body>
              <h1>Instance in Availability Zone: $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)</h1>
              </body>
              </html>" > /var/www/html/index.html
              echo "<html>
              <head>
              <title>Health Check</title>
              </head>
              <body>
              <h1>Status: Healthy</h1>
              </body>
              </html>" > /var/www/html/health.html
              EOF

  tags = { Name = "Ec2 Linux - Private ${count.index + 1}" }

}

resource "aws_instance" "ec2_linux_az_2_neto" {
  count             = var.instances_count
  availability_zone = var.azs[2] #não é a melhor forma Precisa melhorar
  ami               = var.ami-linux
  instance_type     = var.instance_type
  key_name          = var.aws-key
  subnet_id         = var.subnetPrivateIds[1]
  security_groups   = [var.segGroupPrivateId[1]]
  //associate_public_ip_address = count.index == 0 ? true : false

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apache2
              systemctl start apache2
              systemctl enable apache2
              echo "<html>
              <head>
              <title>Instance in AZ</title>
              <style>
              body { font-family: Arial, sans-serif; background-color: #f0f0f0; margin: 40px; }
              h1 { color: #333; }
              p { color: #666; }
              </style>
              </head>
              <body>
              <h1>Instance in Availability Zone: $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)</h1>
              </body>
              </html>" > /var/www/html/index.html
              echo "<html>
              <head>
              <title>Health Check</title>
              </head>
              <body>
              <h1>Status: Healthy</h1>
              </body>
              </html>" > /var/www/html/health.html
              EOF

  tags = { Name = "Ec2 Linux - Private ${count.index + 2}" }

}

resource "aws_network_interface" "ec2_linux_interfaces" {

  subnet_id       = var.subnetPublicId
  private_ips     = [var.IpDmzFixo]
  security_groups = [var.segGroupPublicId]

  attachment {
    instance     = aws_instance.ec2_linux_public.id
    device_index = 1
  }
}
