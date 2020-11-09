
# VPC
resource "aws_vpc" "reut_vpc" {
  enable_dns_hostnames = "true" 
  cidr_block           = var.vpc_cidr_block

  tags = {
    Name    = "reut_vpc"
    purpose = "opsschool"
  }
}

# Subnets : public
resource aws_subnet "public_subnet" {
  count                   = length(var.public_subnets_cidr)
  map_public_ip_on_launch = "true"
  cidr_block              = var.public_subnets_cidr[count.index]
  vpc_id                  = aws_vpc.reut_vpc.id
  availability_zone       = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "public_subnet_${count.index + 1}"
  }
}

#Subnets : private
resource aws_subnet "private_subnet" {
  count                   = length(var.private_subnets_cidr)
  map_public_ip_on_launch = "false"
  vpc_id                  = aws_vpc.reut_vpc.id
  cidr_block              = var.private_subnets_cidr[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "private_subnet_${count.index + 1}"
  }
}

#Nat gatways for the private subnets
resource "aws_nat_gateway" "private_subnet" {
  count         = length(var.subnets_cidr_private)
  allocation_id = aws_eip.nat.*.id[count.index]
  subnet_id     = aws_subnet.private_subnet.*.id[count.index]
  tags = {
    Name = "NAT_${count.index}"
  }
}

# Internet Gateway
resource aws_internet_gateway "reut_igw" {
  vpc_id = aws_vpc.reut_vpc.id
  tags = {
    Name = "igw"
  }
}

