module "vpc_module_reut" {
  source               = "../vpc_module_reut"
  vpc_cidr_block       = "10.0.0.0/16"
  public_subnets_cidr  = ["10.0.300.0/24", "10.0.400.0/24"]
  private_subnets_cidr = ["10.0.3.0/24", "10.0.4.0/24"]
  aws_region           = "us-east-1"
}