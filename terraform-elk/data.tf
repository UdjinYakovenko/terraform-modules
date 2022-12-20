data "aws_ami" "elk" {
  most_recent = true
  owners = [var.owner]

  filter {
    name                 = "name"
    values               = ["ELK*"]
  }
}