resource "aws_instance" "openvpn" {
  ami                    = "${data.aws_ami.openvpn.id}"
  instance_type          = var.instance_type
  key_name               = var.key_name
  #availability_zone      = var.azs
  subnet_id              = var.subnet_ids[0]
  vpc_security_group_ids = [aws_security_group.openvpn.id]

  tags = {
    Name = "${var.name_prefix}_OpenVPN"
  }
}