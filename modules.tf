module "network" {
  source = "./modules/network"
  
  region = var.aws_region
  infra_name = var.infra_name
}
