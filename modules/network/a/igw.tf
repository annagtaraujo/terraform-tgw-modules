resource "aws_internet_gateway" "igw_a" {
  description = "IGW Public VPC A"
  vpc_id = aws_vpc.infra_vpc_a.id
  tags = {
      Name = format("%s-vpc-a-igw", var.infra_name)
  }
}

resource "aws_internet_gateway" "private_igw_a" { 
  description = "IGW Alternativo. Não ideal pois não tem NAT GW"
  vpc_id = aws_vpc.infra_vpc_a.id
}
