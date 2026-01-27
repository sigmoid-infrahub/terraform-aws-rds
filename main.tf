resource "aws_db_instance" "this" {
  identifier = var.identifier
  engine     = var.engine

  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type

  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids

  multi_az            = var.multi_az
  publicly_accessible = var.publicly_accessible
  db_name             = var.db_name

  username = var.username
  password = var.password

  port = var.port

  backup_retention_period      = var.backup_retention_period
  deletion_protection          = var.deletion_protection
  storage_encrypted            = var.storage_encrypted
  kms_key_id                   = var.kms_key_id
  performance_insights_enabled = var.performance_insights_enabled
  skip_final_snapshot          = var.skip_final_snapshot

  tags = local.resolved_tags
}
