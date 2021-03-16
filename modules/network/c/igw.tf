resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.infra_vpc_c.id
  tags = {
      Name = format("%s-vpc-c-igw", var.infra_name)
  }
}

resource "aws_internet_gateway" "private_igw" { 
  vpc_id = aws_vpc.infra_vpc_c.id
}
