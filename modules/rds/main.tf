resource "aws_db_instance" "rds" {
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  db_name              = var.db_name
  identifier           = var.db_instance_identifier
  engine               = var.db_engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  vpc_security_group_ids = var.sg
  db_subnet_group_name = var.subnet_group_name
  multi_az               = false
  publicly_accessible  = false
  skip_final_snapshot  = true

  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window

  deletion_protection      = var.deletion_protection
  delete_automated_backups = var.delete_automated_backups

  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  apply_immediately           = var.apply_immediately
  maintenance_window          = var.maintenance_window

  tags = var.tags
}