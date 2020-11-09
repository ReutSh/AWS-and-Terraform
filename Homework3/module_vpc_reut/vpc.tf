
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
  availability_zone       = data.aws_availability_zones.available.names[count.index] #you set the data resource of avialble zones only in the clinet directory. if the resources of the vpc module need to use this data resource also, you should add it also in the module directory. i created data file for you in the module directory and added the data resouces there.

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
  count  = 2 #you set: length(var.subnets_cidr_private) . I changed to "2" just to make it work for now. because this variable (subnets_cidr_private) does not exist! please create this variable and than replace back to use the var.
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

