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

  rds_port = var.engine == "postgres" ? 5432 : 3306

  effective_ingress_rules = length(var.ingress_rules) > 0 ? var.ingress_rules : [
    {
      from_port                 = local.rds_port
      to_port                   = local.rds_port
      protocol                  = "tcp"
      cidr_blocks               = var.security_group_ingress_cidr_blocks
      source_security_group_ids = []
      description               = null
    }
  ]
}
