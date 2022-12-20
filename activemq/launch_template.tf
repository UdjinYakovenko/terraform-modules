resource "aws_launch_template" "activemq" {
  name = "${var.name_prefix}_activemq"
#  block_device_mappings {
#    device_name = "/dev/sda1"
#    ebs {
#      volume_size = 8
#      volume_type = "standard"
#    }
#  }

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  disable_api_termination = true

  ebs_optimized = true

  iam_instance_profile {
    name = "${var.name_prefix}_activemq"
  }

  image_id = var.ami_id

  instance_initiated_shutdown_behavior = "terminate"

#  instance_market_options {
#    market_type = "spot"
#  }

  instance_type = var.instance_type

  key_name = var.key_name

  monitoring {
    enabled = true
  }

#  network_interfaces {
#    associate_public_ip_address = true
#    security_groups = var.security_groups
#    subnet_id = ""
#  }

  vpc_security_group_ids = var.security_groups

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.name_prefix}_activemq"
    }
  }

#  user_data = filebase64("${path.module}/example.sh")
}