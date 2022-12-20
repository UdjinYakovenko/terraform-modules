resource "aws_instance" "mongo" {
  ami                    = "${data.aws_ami.mongo.id}"
  instance_type          = var.instance_type
  key_name               = var.key_name
  #availability_zone      = var.vpc.azs[0]
  subnet_id              = var.subnet_ids[0]
  vpc_security_group_ids = [aws_security_group.mongodb-sg.id]
  #count = length(var.subnet_ids)

  tags = {
    Name = "MongoDB"
  }
}