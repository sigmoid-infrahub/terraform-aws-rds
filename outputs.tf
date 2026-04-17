output "db_instance_id" {
  description = "RDS instance ID"
  value       = aws_db_instance.this.id
}

output "endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.this.endpoint
}

output "db_subnet_group_name" {
  description = "DB subnet group name"
  value       = local.db_subnet_group_name
}

output "security_group_id" {
  description = "Created security group ID"
  value       = var.create_security_group ? aws_security_group.this[0].id : null
}

output "monitoring_role_arn" {
  description = "Enhanced monitoring role ARN"
  value       = local.monitoring_role_arn
}

output "parameter_group_name" {
  description = "DB parameter group name"
  value       = local.parameter_group_name
}

output "module" {
  description = "Full module outputs"
  value = {
    db_instance_id       = aws_db_instance.this.id
    endpoint             = aws_db_instance.this.endpoint
    db_subnet_group_name = local.db_subnet_group_name
    security_group_id    = var.create_security_group ? aws_security_group.this[0].id : null
    monitoring_role_arn  = local.monitoring_role_arn
    parameter_group_name = local.parameter_group_name
  }
}
