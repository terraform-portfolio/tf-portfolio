resource "aws_instance" "bastion" {
  ami                         = "ami-0b7546e839d7ace12"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.bastion-sg.id]
  subnet_id                   = aws_subnet.public_1a.id
  associate_public_ip_address = true
  key_name               = "${var.my-key}"

  tags = {
    Name = "${var.tag-name}-bastion"
  }
}


resource "aws_instance" "web" {
  ami                    = "ami-0b7546e839d7ace12"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  subnet_id              = aws_subnet.private_1c.id
  key_name               = "${var.my-key}"

  tags = {
    Name = "${var.tag-name}-web"
  }
}