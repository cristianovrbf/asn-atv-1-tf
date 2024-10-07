resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = var.rds_subnet_group_name
  subnet_ids = var.subnets

  tags = merge(
    var.general_tags,
    {
      Name = var.rds_subnet_group_name
    }
  )
}

resource "aws_db_instance" "rds_instance" {
  allocated_storage       = 20
  db_name                 = var.database_name
  engine                  = var.database_engine
  engine_version          = var.database_engine_version
  instance_class          = var.instance_class
  username                = var.database_username
  password                = var.database_password
  backup_retention_period = var.database_backup_retention
  parameter_group_name    = "default.mysql8.0"
  publicly_accessible     = false
  vpc_security_group_ids  = [var.security_group_id]
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name

  tags = merge(
    var.general_tags,
    {
      Name = var.rds_instance_name
    }
  )
}