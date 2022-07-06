resource "aws_internet_gateway" "portfolio-vpc" {
  vpc_id = aws_vpc.portfolio-vpc.id

  tags = {
    Name = "${var.tag-name}-igw"
  }
}
