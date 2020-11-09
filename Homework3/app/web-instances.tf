#Web server instances
resource "aws_instance" "nginx" {
  count                       = var.count_nginx_instances
  ami                         = data.aws_ami.ubuntu-18.id
  instance_type               = var.instance_type #you set: instance_type . fixed. should be with referrnce to the variable
  user_data                   = file("nginx.sh")  # fixed. you set: fie("nginx.sh"). should be file not fie
  key_name                    = var.key_name
  subnet_id                   = module.vpc_module_reut.public_subnets_id[count.index] # you set: module.vpc_module_reut.public_subnet_id[count.index] you set the name of this output with subnets (s) no subnet that's why it didn't work for you .
  vpc_security_group_ids      = [aws_security_group.nginx_instnaces_access.id]
  associate_public_ip_address = true

  tags = {
    Name    = "Nginx-${count.index + 1}"
    purpose = "Terraform hw3"
  }
}