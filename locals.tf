locals {
  sigmoid_tags = merge(
    var.sigmoid_environment != "" ? { "sigmoid:environment" = var.sigmoid_environment } : {},
    var.sigmoid_project != "" ? { "sigmoid:project" = var.sigmoid_project } : {},
    var.sigmoid_team != "" ? { "sigmoid:team" = var.sigmoid_team } : {},
  )


  resolved_tags = merge({
    ManagedBy = "sigmoid"
  }, var.tags, local.sigmoid_tags)

  db_subnet_group_name = var.create_db_subnet_group ? aws_db_subnet_group.this[0].name : var.db_subnet_group_name
  parameter_group_name = var.create_parameter_group ? aws_db_parameter_group.this[0].name : var.parameter_group_name
  security_group_ids   = var.create_security_group ? [aws_security_group.this[0].id] : var.vpc_security_group_ids
  monitoring_role_arn  = var.create_monitoring_role ? aws_iam_role.enhanced_monitoring[0].arn : var.monitoring_role_arn
}
