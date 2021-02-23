locals {
  route_tables_pb = [
    {
      vpc_id : aws_vpc.infra_name.id,
      tags : merge(var.tags, { Name : format("%s-pb-a", var.infra_name) })
    },
    {
      vpc_id : aws_vpc.infra_name.id,
      tags : merge(var.tags, { Name : format("%s-pb-b", var.infra_name) }) 
    },
    {
      vpc_id : aws_vpc.infra_name.id,
      tags : merge(var.tags, { Name : format("%s-pb-c", var.infra_name) })
    },
    {
      vpc_id : aws_vpc.infra_name.id,
      tags : merge(var.tags, { Name : format("%s-pb-d", var.infra_name) })
    }

  ]
}

  resource "aws_route_table" "public-table" {
  for_each = {
    for config in local.route_tables_pb :
      config.tags => config
  }
  vpc_id            = aws_vpc.infra-vpc.id
  tags              = each.value["tags"]
}