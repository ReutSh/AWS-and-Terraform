#Web server instances
resource "aws_instance" "nginx" {
  count         = var.count_nginx_instances
  ami           = data.aws_ami.ubuntu-18.id
  instance_type = instance_type
  user_data     = fie("nginx.sh")
  key_name      = var.key_name
  subnet_id     = module.vpc_module_reut.public_subnet_id[count.index]
  vpc_security_group_ids = [aws_security_group.nginx_instnaces_access.id]
  associate_public_ip_address = true

  tags = {
    Name    = "Nginx-${count.index + 1}"
    purpose = "Terraform hw3"
  }
}