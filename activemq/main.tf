#resource "aws_lb_target_group" "activemq" {
#  name     = "activemq"
#  port     = 61617
#  protocol = "TCP"
#  vpc_id   = var.vpc_id
#  slow_start = 300
#  health_check {
#    enabled = true
#  }
#}

resource "aws_iam_instance_profile" "activemq" {
  name = "${var.name_prefix}_activemq"
  role = aws_iam_role.role.name
}

resource "aws_iam_role" "role" {
  name               = "${var.name_prefix}_activemq"
  path               = "/"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "role_policy" {
  name   = "${var.name_prefix}_activemq"
  role   = aws_iam_role.role.id
  policy = data.aws_iam_policy_document.policy-doc.json
}

data "aws_iam_policy_document" "policy-doc" {
  statement {
    effect    = "Allow"
    actions   = [
      "ec2:DescribeTags",
    ]
    resources = [
      "*"
    ]
  }
  statement {
    effect    = "Allow"
    actions   = [
      "route53:ChangeResourceRecordSets",
    ]
    resources = [
      "arn:aws:route53:::hostedzone/${var.route53_zone}"
    ]
  }
}