resource "aws_instance" "reut_db" {
  count                  = 2                         #why for nginx you set a count var and for database you didnt? please use var here like you did in web-instances file
  ami                    = data.aws_ami.ubuntu-18.id #you set:data.aws_ami.ubuntu.id. fixed. this was not the name of the resoure.
  instance_type          = "t2.medium"               # why you didn't use instance type variable like you did in the nginx instances? please fix it
  key_name               = var.key_name
  subnet_id              = module.vpc_module_reut.private_subnet_id[count.index] #you set:aws_subnet.private_subnet.*.id[count.index] .fixed. why dont you change to module refernce like i teach you - (module.module_block_name.output_name)?
  vpc_security_group_ids = [aws_security_group.DB_instnaces_access.id]

  tags = {
    Name    = "DB-${count.index + 1}"
    purpose = "terraform hw exe4"
  }
}