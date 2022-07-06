resource "aws_eip" "nat_1a" {
  vpc = true

  tags = {
    Name = "${var.tag-name}-eip"
  }
}

resource "aws_nat_gateway" "nat_1a" {
  subnet_id     = aws_subnet.public_1a.id
  allocation_id = aws_eip.nat_1a.id

  tags = {
    Name = "${var.tag-name}-ngw"
  }
}