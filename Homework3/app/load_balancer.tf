#Load Balancer

resource "aws_elb" "nginx" {
  name            = "nginx-elb"
  subnets         = module.vpc_module_reut.public_subnets_id #you set: [aws_subnet.public_subnet[0].id, aws_subnet.public_subnet[1].id] .fixed. why you didn't change to module refrence syntax like i showed you? you can't set it like that. these subnet resouces created in the module. you set: [aws_subnet.public_subnet[0].id, aws_subnet.public_subnet[1].id]
  instances       = aws_instance.nginx.*.id                  #you set: [aws_instance.nginx[0].id, aws_instance.nginx[1].id] . fixed. instead set list with one by one, you can use this syntax. it will take all the instance IDd created in this block.
  security_groups = [aws_security_group.nginx_instnaces_access.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  tags = {
    Name = "nginx-elb"
  }
}
