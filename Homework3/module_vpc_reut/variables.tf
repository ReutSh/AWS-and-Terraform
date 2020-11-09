variable aws_region {
description = "the aws region"
}

variable "vpc_cidr_block" {
description = "the cidr block chosed for the vpc, for exampe - 10.0.0.0/16 "
}

variable "public_subnets_cidr" {
  type        = list(string)
  description = "list of public subnets, for example ['10.0.100.0/24', '10.0.200.0/24']"
}

variable "private_subnets_cidr" {
  type        = list(string)
  description = "list of private subnets, for example ['10.0.1.0/24', '10.0.2.0/24']"
}

variable "route_tables_names" {
  type    = list(string)
  default = ["public", "private_rt_1","private_rt_2"]  
}



