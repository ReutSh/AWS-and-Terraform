terraform {
  backend "s3" {
    bucket  = "remote-state-opsschool-tf"
    key     = "project" #you set- "global/s3/terraform1.tfstate" not sure what is it . fixed. You just need to provide a name of a folder where the state will be stored in s3
    region  = "us-east-1"
    profile = "reut"
  }
}