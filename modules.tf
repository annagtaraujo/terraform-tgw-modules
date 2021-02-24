module "network" {
  source = "./modules/network"
  
  aws_region = var.aws_region
  infra_name = var.infra_name
}
