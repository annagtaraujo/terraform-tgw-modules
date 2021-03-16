#resource "aws_vpc_peering_connection" "vpc_peer_b_to_a" {
#  peer_owner_id = var.peer_owner_id
#  peer_vpc_id   = aws_vpc.infra_vpc_a.id
#  vpc_id        = aws_vpc.infra_vpc_b.id

#  accepter {
#    allow_remote_vpc_dns_resolution = true
#  }

#  requester {
#    allow_remote_vpc_dns_resolution = true
#  }
#}

#resource "aws_vpc_peering_connection" "vpc_peer_c_to_a" {
#  peer_owner_id = var.peer_owner_id
#  peer_vpc_id   = aws_vpc.infra_vpc_a.id
#  vpc_id        = aws_vpc.infra_vpc_c.id

#  accepter {
#    allow_remote_vpc_dns_resolution = true
#  }

#  requester {
#    allow_remote_vpc_dns_resolution = true
#  }
#}

#resource "aws_vpc_peering_connection" "vpc_peer_a_to_b" {
#  peer_vpc_id   = aws_vpc.infra_vpc_b.id
#  vpc_id        = aws_vpc.infra_vpc_a.id

#  accepter {
#    allow_remote_vpc_dns_resolution = true
#  }

#  requester {
#    allow_remote_vpc_dns_resolution = true
#  }
#}

#resource "aws_vpc_peering_connection" "vpc_peer_a_to_c" {
#  peer_vpc_id   = aws_vpc.infra_vpc_c.id
#  vpc_id        = aws_vpc.infra_vpc_a.id

#  accepter {
#    allow_remote_vpc_dns_resolution = true
#  }

#  requester {
#    allow_remote_vpc_dns_resolution = true
#  }
#}
