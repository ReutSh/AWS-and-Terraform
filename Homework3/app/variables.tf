variable "instance_type" {
  description = "the type of ec2 instance, for example t2.micro"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "the name of the key pair to use when launching the instance "
  default     = "Reut"
  type        = string
}

variable "count_nginx_instances" {
  default = 2
}

variable "count_db_instances" {
  default = 2
}

variable "aws_region" {
  default = "us-east-1"
}

variable "public_subnets_cidr" {
  default = ["10.0.5.0/24", "10.0.6.0/24"] 
}

variable "private_subnets_cidr" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}
        
 variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

