 provider "aws" {
    profile = reut
    region = us-east-1
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
#not sure what this is
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "Reut_terraform_test" {
  count = 2
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.medium"
  subnet_id = "subnet-01792509a3e220b16"

  ebs_block_device  {
  device_name = "xvdf"
  volume_size = 10 
} 
  
  tags = {
  Name = "Reut_server ${count.index}"
  purpose = "Terraform hw exe4"
}
