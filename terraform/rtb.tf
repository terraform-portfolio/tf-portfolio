# igw-rtb
# Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.portfolio-vpc.id

  tags = {
    Name = "${var.tag-name}-public-rtb"
  }
}

# Route
resource "aws_route" "public" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.portfolio-vpc.id
}

# Association
resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_1c" {
  subnet_id      = aws_subnet.public_1c.id
  route_table_id = aws_route_table.public.id
}

# natgw-rtb
# Route Table (Private)
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.portfolio-vpc.id

  tags = {
    Name = "${var.tag-name}-private-rtb"
  }
}

# Route (Private)
resource "aws_route" "private_1a" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.private.id
  nat_gateway_id         = aws_nat_gateway.nat_1a.id
}

# Association (Private)
resource "aws_route_table_association" "private_1a" {
  subnet_id      = aws_subnet.private_1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_1c" {
  subnet_id      = aws_subnet.private_1c.id
  route_table_id = aws_route_table.private.id
}