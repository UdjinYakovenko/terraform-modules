resource "aws_security_group" "mongodb-sg"{
  name              = "MongoDB SG-TF"
  vpc_id            = var.vpc_id

  ingress {
    from_port       = 27017
    to_port         = 27017
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 9216
    to_port         = 9216
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

    ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
    tags = {
        "Name"      = "MongoDB SG-TF"
    }
}
