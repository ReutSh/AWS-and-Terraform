module "vpc_module_reut" {
  source               = "../module_vpc_reut" #you set: "../vpc_module_reut" why? this is not the name or your directory!
  vpc_cidr_block       = "10.0.0.0/16"
  public_subnets_cidr  = ["10.0.5.0/24", "10.0.6.0/24"] #fixed. you set: ["10.0.300.0/24", "10.0.400.0/24"] these not a valid CIDR block. please read about cidr blocks.
  private_subnets_cidr = ["10.0.3.0/24", "10.0.4.0/24"]
  aws_region           = "us-east-1"
}