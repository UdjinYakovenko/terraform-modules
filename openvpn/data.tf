data "aws_ami" "openvpn" {
  most_recent = true
  owners = [var.owner]

  filter {
    name                 = "name"
    values               = ["openvpn*"]
  }
}