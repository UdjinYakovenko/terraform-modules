resource "aws_db_subnet_group" "db_subnet_group" {
  name                      = "dbsubnet_group"
  subnet_ids                = var.subnet_ids

  tags = {
    Name                    = "My DB subnet group"
  }
}

resource "aws_db_instance" "grafana-db" {
  identifier                = var.identifier
  allocated_storage         = var.storage
  storage_type              = var.storage_type
  engine                    = var.engine
  engine_version            = var.engine_version
  instance_class            = var.db_instance_class
  name                      = var.db_name
  username                  = var.username
  #password                  = random_password.password.result
  password                  = var.password
  parameter_group_name      = var.parameter_group_name
  final_snapshot_identifier = var.snapshot
  skip_final_snapshot       = true
  multi_az                  = false
  vpc_security_group_ids    = [aws_security_group.Grafana-db-sg.id]
  db_subnet_group_name      = aws_db_subnet_group.db_subnet_group.name

 tags = {
    Name                    = "Grafana Database"
  }
}