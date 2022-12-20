resource "aws_security_group" "Grafana-db-sg"{
  name              = "RDS Security Group"
  vpc_id            = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
    tags = {
        "Name"      = "Grafana RDS Security Group"
    }
}

resource "aws_security_group" "asg" {
  name              = "ASG Security Group"
  vpc_id            = var.vpc_id

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    #security_groups = [aws_security_group.elb_http.id]
  }

    ingress {
    from_port       = 9090
    to_port         = 9090
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    #security_groups = [aws_security_group.elb_http.id]
  }

  tags = {
    Name            = "Grafana ASG Security Group"
  }
}

resource "aws_security_group" "elb_http" {
  name              = "ELB Security Group"
  vpc_id            = var.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

    ingress {
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name            = "Grafana ELB Security Group"
  }
}