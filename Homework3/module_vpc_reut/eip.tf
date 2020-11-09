#Elastic IP nat
resource aws_eip "nat" {
  count = length(var.private_subnets_cidr) # Moved from client diretory to module directory. this should be part of your vpc module! this is the elastic ip of your NATS. you can't use it in the client directory.

  tags = {
    Name = "NAT-eip-${count.index + 1}"
  }
}