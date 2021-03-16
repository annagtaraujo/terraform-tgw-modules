resource "aws_subnet" "vpc-private-subnet" {
  description = "Private subnet VPC C"
  for_each = {
    for config in local.private_subnets :
      config.cidr_block => config
  }
  vpc_id            = aws_vpc.infra_vpc_c.id
  cidr_block        = each.value["cidr_block"]
  availability_zone = each.value["availability_zone"]
  tags              = each.value["tags"]
  map_public_ip_on_launch = true

  depends_on = [aws_vpc.infra_vpc_c]
}

resource "aws_subnet" "vpc-public-subnet" {
  description = "Public subnet VPC C"
  for_each = {
    for config in local.public_subnets :
      config.cidr_block => config
  }
  vpc_id            = aws_vpc.infra_vpc_c.id
  cidr_block        = each.value["cidr_block"]
  availability_zone = each.value["availability_zone"]
  tags              = each.value["tags"]

  depends_on = [aws_vpc.infra_vpc_c]
}

resource "aws_subnet" "vpc-database-subnet" {
  description = "Database subnet VPC C"
  for_each = {
    for config in local.database_subnets :
    config.cidr_block => config
  }
  vpc_id            = aws_vpc.infra_vpc_c.id
  cidr_block        = each.value["cidr_block"]
  availability_zone = each.value["availability_zone"]
  tags              = each.value["tags"]

  depends_on = [aws_vpc.infra_vpc_c]
}


