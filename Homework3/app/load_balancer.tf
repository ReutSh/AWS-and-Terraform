#Load Balancer

resource "aws_elb" "nginx" {
  name            = "nginx-elb"
  subnets         = module.module_vpc_reut.public_subnets_id 
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
}
resource "aws_lb_cookie_stickiness_policy" "lb_stickiness" {
  name                     = "webservers-stickiness"
  load_balancer            = aws_elb.nginx.id
  lb_port                  = 80
  cookie_expiration_period = 60
  }
#Public ELB DNS Name

output "aws_elb_public_dns" {
value = aws_elb.nginx.dns_name
}