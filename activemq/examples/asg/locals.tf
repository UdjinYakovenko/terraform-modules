data "aws_caller_identity" "current" {
}

locals {
  activemq_ami = {
    filter = ["activemq-BASE-v*"]
    owners = [data.aws_caller_identity.current.account_id]
  }
}

data "aws_ami" "activemq_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["activemq-BASE-v*"]
  }

  owners = [data.aws_caller_identity.current.account_id]
}