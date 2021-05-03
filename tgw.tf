module "tgw" {
  source  = "terraform-aws-modules/transit-gateway/aws"
  version = "~> 2.0"

  create_tgw      = true
  name            = format("%s-tgw",var.infra_name)
  description     = "Meu TGW entre VPCs A e B"
  amazon_side_asn = 64532

  enable_auto_accept_shared_attachments = true # When "true" there is no need for RAM resources if using multiple AWS accounts

  vpc_attachments = {
    
    vpc_a = {
      vpc_id                                          = module.vpc_a.vpc_id
      subnet_ids                                      = module.vpc_a.private_subnets
      dns_support                                     = false #o true deu problema: send request failed │ caused by: Post "https://ec2.us-west-2.amazonaws.com/": read tcp 192.168.0.97:32794->54.240.253.45:443: read: connection reset by peer
      ipv6_support                                    = false
      transit_gateway_default_route_table_association = false
      transit_gateway_default_route_table_propagation = false
      #      transit_gateway_route_table_id = "tgw-rtb-073a181ee589b360f"

      tgw_routes = [
        {
          destination_cidr_block = "10.20.0.0/16"
        },
        {
          blackhole              = true
          destination_cidr_block = "0.0.0.0/0"
        }
      ]
    },
    vpc_b = {
      vpc_id     = module.vpc_b.vpc_id
      subnet_ids = module.vpc_b.private_subnets

      tgw_routes = [
        {
          destination_cidr_block = "10.10.0.0/16"
        },
        {
          blackhole              = true
          destination_cidr_block = "0.0.0.0/0"
        }
      ]
    },
  }

  ram_allow_external_principals = true
  ram_principals = [307990089504]

  tags = {
    Purpose = format("%s-tgw",var.infra_name)
  }
}