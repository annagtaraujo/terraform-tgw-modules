module "vpc_a" {
  source = "terraform-aws-modules/vpc/aws"

  name = format("%s-vpc-a", var.infra_name)
  cidr = "10.10.0.0/16"

  azs              = ["us-west-2a", "us-west-2b"]#, "us-west-2c", "us-west-2d"]

  public_subnets   = ["10.10.11.0/24", "10.10.12.0/24"]#, "10.10.13.0/24", "10.10.14.0/24"]
  public_subnet_suffix = "subnet-pb"

  private_subnets  = ["10.10.21.0/24", "10.10.22.0/24"]#, "10.10.23.0/24", "10.10.24.0/24"]
  private_subnet_suffix = "subnet-pv"

  database_subnets = ["10.10.31.0/24", "10.10.32.0/24"]#, "10.10.33.0/24", "10.10.34.0/24"]
  database_subnet_suffix = "subnet-db"

  create_igw            = true
  enable_nat_gateway     = true
  #single_nat_gateway     = false
  one_nat_gateway_per_az = true
  #enable_vpn_gateway     = true
  enable_dns_hostnames    = true

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
}

module "vpc_b" {
  source = "terraform-aws-modules/vpc/aws"

  name = format("%s-vpc-b", var.infra_name)
  cidr = "10.20.0.0/16"

  azs              = ["us-west-2a", "us-west-2b"]#, "us-west-2c", "us-west-2d"]

  public_subnets   = ["10.20.11.0/24", "10.20.12.0/24"]#, "10.20.13.0/24", "10.20.14.0/24"]
  public_subnet_suffix = "subnet-pb"
  
  private_subnets  = ["10.20.21.0/24", "10.20.22.0/24"]#, "10.20.23.0/24", "10.20.24.0/24"]
  private_subnet_suffix = "subnet-pv"
  
  database_subnets = ["10.20.31.0/24", "10.20.32.0/24"]#, "10.20.33.0/24", "10.20.34.0/24"]
  database_subnet_suffix = "subnet-db"

  create_igw            = true
  enable_nat_gateway     = true
  #single_nat_gateway     = false
  one_nat_gateway_per_az = true
  #enable_vpn_gateway     = true
  enable_dns_hostnames    = true

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
}
