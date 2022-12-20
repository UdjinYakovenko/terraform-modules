resource "aws_db_subnet_group" "boundary_db_subnet_group" {
  name                      = "boundary_db_subnet_group"
  subnet_ids                = var.subnet_ids

  tags = {
    Name                    = "Boundary DB Subnet Group"
  }
}

resource "aws_db_instance" "boundary-db" {
  identifier                = var.identifier
  allocated_storage         = var.storage
  storage_type              = var.storage_type
  engine                    = var.engine
  engine_version            = var.engine_version
  instance_class            = var.db_instance_class
  name                      = var.db_name
  username                  = var.username
  password                  = var.password
  parameter_group_name      = var.parameter_group_name
  final_snapshot_identifier = var.snapshot
  skip_final_snapshot       = true
  multi_az                  = false
  vpc_security_group_ids    = [aws_security_group.boundary-db-sg.id]
  db_subnet_group_name      = aws_db_subnet_group.boundary_db_subnet_group.name

 tags = {
    Name                    = "Boundary Database"
  }
}