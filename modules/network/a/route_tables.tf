resource "aws_route_table" "public_table_a" {
  vpc_id            = aws_vpc.infra_vpc_a.id
  dynamic "route" {
    for_each = toset([for config in local.public_subnets_a: config.cidr_block ])
    content {
      cidr_block = route.value
      gateway_id = aws_internet_gateway.igw_a.id
    }
  }
  
  depends_on = [
    aws_vpc.infra_vpc_a,
    aws_internet_gateway.igw_a
    ]
  
  tags = {
    Name = format("%s-vpc-a-pb-table", var.infra_name)
    }
}

resource "aws_route_table" "private_table_a" {
  vpc_id = aws_vpc.infra_vpc_a.id

  dynamic "route" {
    for_each = toset([for config in concat(local.private_subnets_a, local.database_subnets_a): config.cidr_block ])

    content {
      cidr_block = route.value
      gateway_id = aws_internet_gateway.private_igw_a.id
    }
  }

  depends_on = [
    aws_vpc.infra_vpc_a,
    aws_internet_gateway.private_igw_a
  ]

    tags = {
    Name = format("%s-vpc-a-pv-table", var.infra_name)
    }
}


resource "aws_route" "public_internet_gateway_a" {
  route_table_id         = aws_route_table.public_table_a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_a.id

  timeouts {
    create = "5m"
  }
}

resource "aws_route_table_association" "public_a"{  #Não consigo associar com os subnet ids pois não os conheço 
   gateway_id = aws_internet_gateway.igw_a.id       #antes do apply. Então associo com meu IGW mesmo
   route_table_id = aws_route_table.public_table_a.id
}
#  count          = length(local.public_subnets) #usaria se eu tivesse um objeto definido sem for_each
#  subnet_id      = element(aws_subnet.vpc-public-subnet,count.index)[*].id
#  for_each = toset([for subnet in aws_subnet.vpc-public-subnet : subnet.id])
#  subnet_id     = each.value
#  route_table_id = aws_route_table.public_table.id

# depends_on = [for subnet in aws_subnet.vpc-public-subnet : subnet]


resource "aws_route_table_association" "private_a"{    #Não consigo associar com os subnet ids pois não os conheço 
   gateway_id = aws_internet_gateway.private_igw_a.id  #antes do apply. Então associo com meu IGW mesmo
   route_table_id = aws_route_table.private_table_a.id
}

#  count          = length(local.public_subnets) #usaria se eu tivesse um objeto definido sem for_each
#  subnet_id      = element(aws_subnet.vpc-public-subnet,count.index)[*].id
#  for_each = toset([for subnet in aws_subnet.vpc-public-subnet : subnet.id])
#  subnet_id     = each.value
#  route_table_id = aws_route_table.public_table.id

# depends_on = [for subnet in aws_subnet.vpc-public-subnet : subnet]
