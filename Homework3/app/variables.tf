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

variable "aws_region" {
  default = "us-east-1"
}