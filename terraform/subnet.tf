# Public Subnets
resource "aws_subnet" "public_1a" {
  vpc_id = aws_vpc.portfolio-vpc.id

  availability_zone = "ap-northeast-1a"

  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "${var.tag-name}-public-1a"
  }
}

resource "aws_subnet" "public_1c" {
  vpc_id = aws_vpc.portfolio-vpc.id

  availability_zone = "ap-northeast-1c"

  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "${var.tag-name}-public-1c"
  }
}

# Private Subnets
resource "aws_subnet" "private_1a" {
  vpc_id = aws_vpc.portfolio-vpc.id

  availability_zone = "ap-northeast-1a"
  cidr_block        = "10.0.3.0/24"

  tags = {
    Name = "${var.tag-name}-private-1a"
  }
}

resource "aws_subnet" "private_1c" {
  vpc_id = aws_vpc.portfolio-vpc.id

  availability_zone = "ap-northeast-1c"
  cidr_block        = "10.0.4.0/24"

  tags = {
    Name = "${var.tag-name}-private-1c"
  }
}