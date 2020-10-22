 provider "aws" {
    profile = "reut"
    region = "us-east-1"
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

 owners = ["099720109477"]
}

resource "aws_instance" "Reut_terraform_test" {
  count = 2
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.medium"
  user_data = file(nginx.sh)
  key_name = "Reut"
  subnet_id = "subnet-01792509a3e220b16"
  } 

  resource ebs_block_device "Reut_extra" {
  device_name = "xvdf"
  volume_size = 10
  }

   tags = {
      Name = "Reut_terraform_test ${count.index}" 
      purpose = "Terraform hw exe4" 
      ebs_volume = "Reut_extra"  
  }




