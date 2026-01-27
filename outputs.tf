output "db_instance_id" {
  description = "RDS instance ID"
  value       = aws_db_instance.this.id
}

output "endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.this.endpoint
}

output "module" {
  description = "Full module outputs"
  value = {
    db_instance_id = aws_db_instance.this.id
    endpoint       = aws_db_instance.this.endpoint
  }
}
