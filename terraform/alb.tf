resource "aws_alb" "alb" {
  name                       = "${var.tag-name}-alb"
  security_groups            = ["${aws_security_group.alb-sg.id}"]
  subnets                    = ["${aws_subnet.public_1a.id}","${aws_subnet.public_1c.id}" ]
  internal                   = false
  enable_deletion_protection = false
}


resource "aws_alb_target_group" "alb" {
  name     = "${var.tag-name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.portfolio-vpc.id

  health_check {
    interval            = 30
    path                = "/index.html"
    port                = 80
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
    matcher             = 200
  }
}


resource "aws_alb_target_group_attachment" "alb" {
  target_group_arn = aws_alb_target_group.alb.arn
  target_id        = aws_instance.web.id
  port             = 80
}


resource "aws_alb_listener" "alb" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.alb.arn
    type             = "forward"
  }
}
