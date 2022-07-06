resource "aws_security_group" "bastion-sg" {
  name        = "${var.tag-name}-bastion-sg"
  description = "${var.tag-name}-bastion-sg"
  vpc_id      = aws_vpc.portfolio-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my-ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.tag-name}-bastion-sg"
  }
}

resource "aws_security_group" "alb-sg" {
  name        = "${var.tag-name}-alb-sg"
  description = "${var.tag-name}-alb-sg"
  vpc_id      = aws_vpc.portfolio-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.tag-name}-alb-sg"
  }
}

resource "aws_security_group" "web-sg" {
  name        = "${var.tag-name}-web-sg"
  description = "${var.tag-name}-web-sg"
  vpc_id      = aws_vpc.portfolio-vpc.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb-sg.id]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.tag-name}-web-sg"
  }
}