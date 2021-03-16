resource "aws_internet_gateway" "igw" {
  description = "IGW Public VPC B"
  vpc_id = aws_vpc.infra_vpc_b.id
  tags = {
      Name = format("%s-vpc-b-igw", var.infra_name)
  }
}

resource "aws_internet_gateway" "private_igw" {
  description = "IGW Alternativo. Não ideal pois não tem NAT GW"
  vpc_id = aws_vpc.infra_vpc_b.id
}
