resource "aws_db_subnet_group" "this" {
  count = var.create_db_subnet_group ? 1 : 0

  name       = "${var.identifier}-subnet-group"
  subnet_ids = var.subnet_ids
  tags       = local.resolved_tags
}

resource "aws_db_parameter_group" "this" {
  count = var.create_parameter_group ? 1 : 0

  name   = "${var.identifier}-parameter-group"
  family = var.parameter_group_family

  dynamic "parameter" {
    for_each = var.parameter_group_parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  tags = local.resolved_tags
}

resource "aws_security_group" "this" {
  count = var.create_security_group ? 1 : 0

  name        = "${var.identifier}-rds-sg"
  description = "Security group for RDS ${var.identifier}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.engine == "postgres" ? 5432 : 3306
    to_port     = var.engine == "postgres" ? 5432 : 3306
    protocol    = "tcp"
    cidr_blocks = var.security_group_ingress_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.resolved_tags
}

resource "aws_iam_role" "enhanced_monitoring" {
  count = var.create_monitoring_role ? 1 : 0

  name = "${var.identifier}-rds-enhanced-monitoring-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "monitoring.rds.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
  tags = local.resolved_tags
}

resource "aws_iam_role_policy_attachment" "enhanced_monitoring" {
  count = var.create_monitoring_role ? 1 : 0

  role       = aws_iam_role.enhanced_monitoring[0].name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

resource "aws_cloudwatch_log_group" "this" {
  count = var.create_cloudwatch_log_group ? 1 : 0

  name = "/aws/rds/${var.identifier}"
  tags = local.resolved_tags
}

resource "aws_db_instance" "this" {
  identifier = var.identifier
  engine     = var.engine

  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type

  db_subnet_group_name   = local.db_subnet_group_name
  vpc_security_group_ids = local.security_group_ids
  parameter_group_name   = local.parameter_group_name

  multi_az            = var.multi_az
  publicly_accessible = var.publicly_accessible
  db_name             = var.db_name

  username = var.username
  password = var.password

  port = var.port

  backup_retention_period         = var.backup_retention_period
  deletion_protection             = var.deletion_protection
  storage_encrypted               = var.storage_encrypted
  kms_key_id                      = var.kms_key_id
  performance_insights_enabled    = var.performance_insights_enabled
  skip_final_snapshot             = var.skip_final_snapshot
  monitoring_role_arn             = local.monitoring_role_arn
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  tags = local.resolved_tags
}
