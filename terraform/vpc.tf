resource "aws_vpc" "portfolio-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "${var.tag-name}-vpc"
  }
}