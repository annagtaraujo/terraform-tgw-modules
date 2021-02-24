#resource "aws_internet_gateway" "igw" {
#  vpc_id = aws_vpc.infra_name.id
#  tags = {
#      Name = format("%s-igw", var.infra_name)
#  }
#}