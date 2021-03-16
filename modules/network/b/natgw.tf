#resource "aws_eip" "infra_eip"{
#    vpc = true

#    tags = {
#        Name = format("%s-eip", var.infra_name)
#    }
#}

#resource "aws_nat_gateway" "nat"{
#    allocation_id = aws_eip.infra_eip.id
#    for_each = toset([for subnet in aws_subnet.vpc-private-subnet : subnet.id])
#    subnet_id     = each.value

#    depends_on = [
#        aws_vpc.infra_vpc,
#        aws_internet_gateway.igw,
#        aws_subnet.vpc-private-subnet,
#        aws_subnet.vpc-database-subnet,
#        aws_eip.infra_eip
#    ]
#}
