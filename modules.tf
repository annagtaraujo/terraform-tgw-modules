module "network_a" {
  source = "./modules/network/a"
  
  aws_region = var.aws_region
  infra_name = var.infra_name
  
}

module "network_b" {
  source = "./modules/network/b"
  
  aws_region = var.aws_region
  infra_name = var.infra_name
  
}

module "network_c" {
  source = "./modules/network/c"
  
  aws_region = var.aws_region
  infra_name = var.infra_name
  
}
