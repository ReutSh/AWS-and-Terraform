resource "aws_instance" "reut_db" {
  count                  = var.count_db_instances                       
  ami                    = data.aws_ami.ubuntu-18.id 
  instance_type          = "t2.medium"             
  key_name               = var.key_name
  subnet_id              = module.module_vpc_reut.private_subnet_id[count.index] 
  vpc_security_group_ids = [aws_security_group.DB_instnaces_access.id]

  tags = {
    Name    = "DB-${count.index + 1}"
    purpose = "terraform hw exe4"
  }
}