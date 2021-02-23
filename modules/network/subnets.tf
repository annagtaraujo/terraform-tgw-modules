locals {
  private_subnets = [
    {
      availability_zone : format("%sa", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 11),
      tags : merge(var.tags, { Name : format("%s-pv-a", var.infra_name) })
    },
    {
      availability_zone : format("%sb", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 12),
      tags : merge(var.tags, { Name : format("%s-pv-b", var.infra_name) })
    },
    {
      availability_zone : format("%sc", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 13),
      tags : merge(var.tags, { Name : format("%s-pv-c", var.infra_name) })
    },
    {
      availability_zone : format("%sd", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 14),
      tags : merge(var.tags, { Name : format("%s-pv-d", var.infra_name) })
    }
  ]
  public_subnets = [
    {
      availability_zone : format("%sa", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 21),
      tags : merge(var.tags, { Name : format("%s-pb-a", var.infra_name) })
    },
    {
      availability_zone : format("%sb", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 22),
      tags : merge(var.tags, { Name : format("%s-pb-b", var.infra_name) })
    },
    {
      availability_zone : format("%sc", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 23),
      tags : merge(var.tags, { Name : format("%s-pb-c", var.infra_name) })
    },
    {
      availability_zone : format("%sd", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 24),
      tags : merge(var.tags, { Name : format("%s-pb-d", var.infra_name) })
    }
  ]
  database_subnets = [
    {
      availability_zone : format("%sa", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 31),
      tags : merge(var.tags, { Name : format("%s-db-a", var.infra_name) })
    },
    {
      availability_zone : format("%sb", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 32),
      tags : merge(var.tags, { Name : format("%s-db-b", var.infra_name) })
    },
    {
      availability_zone : format("%sc", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 33),
      tags : merge(var.tags, { Name : format("%s-db-c", var.infra_name) })
    },
    {
      availability_zone : format("%sd", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 34),
      tags : merge(var.tags, { Name : format("%s-db-d", var.infra_name) })
    }
  ]
}

resource "aws_subnet" "vpc-private-subnet" {
  for_each = {
    for config in local.private_subnets :
      config.cidr_block => config
  }
  vpc_id            = aws_vpc.infra-vpc.id
  cidr_block        = each.value["cidr_block"]
  availability_zone = each.value["availability_zone"]
  tags              = each.value["tags"]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "vpc-public-subnet" {
  for_each = {
    for config in local.public_subnets :
      config.cidr_block => config
  }
  vpc_id            = aws_vpc.infra-vpc.id
  cidr_block        = each.value["cidr_block"]
  availability_zone = each.value["availability_zone"]
  tags              = each.value["tags"]
}

resource "aws_subnet" "vpc-database-subnet" {
  for_each = {
    for config in local.database_subnets :
    config.cidr_block => config
  }
  vpc_id            = aws_vpc.infra-vpc.id
  cidr_block        = each.value["cidr_block"]
  availability_zone = each.value["availability_zone"]
  tags              = each.value["tags"]
}
