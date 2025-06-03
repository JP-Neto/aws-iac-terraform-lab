resource "aws_alb_target_group" "tg-neto" {
  name     = "Tg-neto"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }
  tags = {
    Name  = "Tg-Neto"
    owner = var.managed-by

  }

}

resource "aws_alb_target_group_attachment" "albAttachment" {
  count            = 2
  target_group_arn = aws_alb_target_group.tg-neto.arn
  target_id        = aws_instance.ec2_linux_az_1_neto[count.index].id
  port             = 80
}

# resource "aws_alb_target_group_attachment" "albAttachment2" {
#  count=2
#   target_group_arn = aws_alb_target_group.tg-neto.arn
#   target_id        = aws_instance.ec2_linux_az_2_neto[count.index].id
#   port             = 80
# }


resource "aws_alb" "albNeto" {
  name               = "albNeto"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.segGroupPrivateId[2]]
  subnets = [
    var.subnetPrivateIds[0],
    var.subnetPrivateIds[1]
  ]

  tags = {
    Name = "albNeto"
  }
}

resource "aws_alb_listener" "http_listener" {
  load_balancer_arn = aws_alb.albNeto.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.tg-neto.arn
  }
}








