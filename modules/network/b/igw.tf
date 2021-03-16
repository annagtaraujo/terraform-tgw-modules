resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.infra_vpc_b.id
  tags = {
      Name = format("%s-vpc-b-igw", var.infra_name)
  }
}

resource "aws_internet_gateway" "private_igw" {
  vpc_id = aws_vpc.infra_vpc_b.id
}
