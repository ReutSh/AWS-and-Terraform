#Web server instances
resource "aws_instance" "nginx" {
  count                       = var.count_nginx_instances
  ami                         = data.aws_ami.ubuntu-18.id
  instance_type               = var.instance_type 
  user_data                   = file("nginx.sh")  
  key_name                    = var.key_name
  iam_instance_profile        = "s3_access_role"
  subnet_id                   = module.module_vpc_reut.public_subnets_id[count.index] 
  vpc_security_group_ids      = [aws_security_group.nginx_instnaces_access.id]
  associate_public_ip_address = true

  tags = {
    Name    = "Nginx-${count.index + 1}"
    purpose = "Terraform hw3"
  }
}