locals {
  private_subnets = [
    {
      availability_zone : format("%sa", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 11),
      tags : { Name : format("%s-pv-a", var.infra_name) }
    },
    {
      availability_zone : format("%sb", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 12),
      tags : { Name : format("%s-pv-b", var.infra_name) }
    },
    {
      availability_zone : format("%sc", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 13),
      tags : { Name : format("%s-pv-c", var.infra_name) }
    },
    {
      availability_zone : format("%sd", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 14),
      tags : { Name : format("%s-pv-d", var.infra_name) }
    }
  ]
  public_subnets = [
    {
      availability_zone : format("%sa", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 21),
      tags : { Name : format("%s-pb-a", var.infra_name) }
    },
    {
      availability_zone : format("%sb", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 22),
      tags : { Name : format("%s-pb-b", var.infra_name) }
    },
    {
      availability_zone : format("%sc", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 23),
      tags : { Name : format("%s-pb-c", var.infra_name) }
    },
    {
      availability_zone : format("%sd", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 24),
      tags : { Name : format("%s-pb-d", var.infra_name) }
    }
  ]
  database_subnets = [
    {
      availability_zone : format("%sa", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 31),
      tags : { Name : format("%s-db-a", var.infra_name) }
    },
    {
      availability_zone : format("%sb", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 32),
      tags : { Name : format("%s-db-b", var.infra_name) }
    },
    {
      availability_zone : format("%sc", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 33),
      tags : { Name : format("%s-db-c", var.infra_name) }
    },
    {
      availability_zone : format("%sd", var.aws_region),
      cidr_block : cidrsubnet(var.cidr_block, 8, 34),
      tags : { Name : format("%s-db-d", var.infra_name) }
    }
  ]
}
