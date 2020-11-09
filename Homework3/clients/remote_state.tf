terraform {
backend "s3" {
    bucket  = "remote-state-opsschool-tf"
    key = "global/s3/terraform1.tfstate"
    region  = "us-east-1"
    profile = "reut"
    }
}