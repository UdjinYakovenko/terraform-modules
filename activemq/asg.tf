locals {
  common_tags = tomap({
    "route53_record" = "${var.route53_host}",
    "route53_zone"   = "${var.route53_zone}"
  })
}

resource "aws_autoscaling_group" "activemq" {
  name = "${var.name_prefix}_activemq"
  depends_on = [aws_iam_instance_profile.activemq]
  vpc_zone_identifier = var.subnet_ids
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.activemq.id
    version = "$Latest"
  }

  tags = concat([
    {
      key = "Name"
      value = "${var.name_prefix}_activemq"
      propagate_at_launch = true
    },
    {
      key = "route53_record"
      value = var.route53_host
      propagate_at_launch = true
    },
    {
      key = "route53_zone"
      value = var.route53_zone
      propagate_at_launch = true
    }
  ])
}
