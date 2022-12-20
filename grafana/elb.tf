/*
resource "aws_elb" "elb" {
  name                      = "elb-internal"
  internal                  = true
  security_groups           = [aws_security_group.elb_http.id]
  subnets                   = var.subnet_ids
  cross_zone_load_balancing = true

  health_check {
    healthy_threshold       = 2
    unhealthy_threshold     = 2
    timeout                 = 3
    interval                = 30
    target                  = "HTTP:3000/api/health"
  }

  listener {
    instance_port           = 3000
    instance_protocol       = "http"
    lb_port                 = 80
    lb_protocol             = "http"
  # ssl_certificate_id      = var.ssl_arn
  }

  tags = {
    Name = "ELB"
  }
}*/
