resource "aws_instance" "elk" {
  ami                    = "${data.aws_ami.elk.id}"
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_ids[0]
  vpc_security_group_ids = [aws_security_group.elk.id]

  tags = {
    Name = "${var.name_prefix}_ELK"
  }
}