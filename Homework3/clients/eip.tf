#Elastic IP nat
resource aws_eip "nat" {
  count = length(var.private_subnets_cidr)

  tags = {
    Name = "NAT-eip-${count.index + 1}"
  }
}