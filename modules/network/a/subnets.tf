resource "aws_subnet" "vpc-private-subnet_a" {
  description = "Private subnet VPC A"
  for_each = {
    for config in local.private_subnets_a :
      config.cidr_block => config
  }
  vpc_id            = aws_vpc.infra_vpc_a.id
  cidr_block        = each.value["cidr_block"]
  availability_zone = each.value["availability_zone"]
  tags              = each.value["tags"]
  map_public_ip_on_launch = true

  depends_on = [aws_vpc.infra_vpc_a]
}

resource "aws_subnet" "vpc-public-subnet_a" {
  description = "Public subnet VPC A"
  for_each = {
    for config in local.public_subnets_a :
      config.cidr_block => config
  }
  vpc_id            = aws_vpc.infra_vpc_a.id
  cidr_block        = each.value["cidr_block"]
  availability_zone = each.value["availability_zone"]
  tags              = each.value["tags"]

  depends_on = [aws_vpc.infra_vpc_a]
}

resource "aws_subnet" "vpc-database-subnet_a" {
  description = "Database subnet VPC A"
  for_each = {
    for config in local.database_subnets_a :
    config.cidr_block => config
  }
  vpc_id            = aws_vpc.infra_vpc_a.id
  cidr_block        = each.value["cidr_block"]
  availability_zone = each.value["availability_zone"]
  tags              = each.value["tags"]

  depends_on = [aws_vpc.infra_vpc_a]
}
