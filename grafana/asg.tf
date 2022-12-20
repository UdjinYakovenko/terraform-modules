data "template_file" "test" {
  template = <<HERE
    #!/bin/bash
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCcPkJjHgBql8WY2vfECyr7bP36cNWSSWGGt56AYGb0QDzvmCvCIr2hcs8052HGqy4UkJyhsVF60jx4eMBztzP5weCWUc1+MsDQBcTqKobgPkLhKd2kA4Jk8uJIpSZnvdH+D5PONMzsVWQQrrThczHkuC7sfWs7BdLzVMMqezNv8kldjhwkcoarJD37i5e12KoNggZpzsh6TIcG/tQABFA9KrDEw2oyEEclloOLxY7nHsj2DKPcq8pP2UkWybtgfNLO8KvpXZ3vS0PdTWmIL6tDZhbeuuqI0WbiFA8AKznDkmzs+d1nD9ixcqLSUrxMdytJCkPPluESzYL/Za/3QeTd ec2-user@ip-172-31-102-53.eu-central-1.compute.internal" > /home/ec2-user/.ssh/authorized_keys
  HERE
}

resource "aws_launch_template" "Grafana" {
  name                        = "Grafana"
  image_id                    = data.aws_ami.Garafana.id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.asg.id]
  key_name                    = var.key_name
  #user_data = "${base64encode(data.template_file.test.rendered)}"

  #  metadata_options {
  #     http_endpoint         = "enabled"
  #     http_tokens           = "required"

   lifecycle {
    create_before_destroy     = true
  }
}

resource "aws_autoscaling_group" "Grafana" {
  name                        = "${var.name_prefix}_Grafana"
  vpc_zone_identifier         = var.subnet_ids
  min_size                    = 1
  desired_capacity            = 1
  max_size                    = 1
//  health_check_grace_period   = 300
//  health_check_type           = "ELB"
//  load_balancers              = [aws_elb.elb.id]

  
  launch_template {
    id                        = aws_launch_template.Grafana.id
    version                   = "$Latest"
  }

  lifecycle {
  create_before_destroy       = true
  }

  tag {
    key                       = "Name"
    value                     = "${var.name_prefix}_Grafana"
    propagate_at_launch       = true
  }
}