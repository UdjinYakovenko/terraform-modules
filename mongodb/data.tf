data "aws_ami" "mongo" {
  most_recent = true
  owners = [var.owner]

  filter {
    name                 = "name"
    values               = ["Mongo*"]
  }
}