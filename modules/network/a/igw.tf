resource "aws_internet_gateway" "igw_a" {
  vpc_id = aws_vpc.infra_vpc_a.id
  tags = {
      Name = format("%s-vpc-a-igw", var.infra_name)
  }
}

resource "aws_internet_gateway" "private_igw_a" { 
  vpc_id = aws_vpc.infra_vpc_a.id
}
