variable "identifier" {
  type        = string
  description = "RDS identifier"
}

variable "engine" {
  type        = string
  description = "Database engine"
}

variable "engine_version" {
  type        = string
  description = "Database engine version"
  default     = null
}

variable "instance_class" {
  type        = string
  description = "Instance class"
}

variable "allocated_storage" {
  type        = number
  description = "Allocated storage (GB)"
  default     = 20
}

variable "storage_type" {
  type        = string
  description = "Storage type"
  default     = "gp3"
}

variable "db_subnet_group_name" {
  type        = string
  description = "DB subnet group name"
  default     = null
}

variable "create_db_subnet_group" {
  type        = bool
  description = "Whether to create a DB subnet group"
  default     = true
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for DB subnet group"
  default     = []
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "VPC security group IDs"
  default     = []
}

variable "create_security_group" {
  type        = bool
  description = "Whether to create a security group for RDS"
  default     = false
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for created security group"
  default     = null
}

variable "security_group_ingress_cidr_blocks" {
  type        = list(string)
  description = "Ingress CIDR blocks for created security group"
  default     = ["10.0.0.0/8"]
}

variable "create_parameter_group" {
  type        = bool
  description = "Whether to create a DB parameter group"
  default     = false
}

variable "parameter_group_name" {
  type        = string
  description = "External DB parameter group name"
  default     = null
}

variable "parameter_group_family" {
  type        = string
  description = "DB parameter group family"
  default     = null
}

variable "parameter_group_parameters" {
  type = list(object({
    name  = string
    value = string
  }))
  description = "Parameter group parameters"
  default     = []
}

variable "create_monitoring_role" {
  type        = bool
  description = "Whether to create an IAM role for enhanced monitoring"
  default     = false
}

variable "monitoring_role_arn" {
  type        = string
  description = "External enhanced monitoring role ARN"
  default     = null
}

variable "create_cloudwatch_log_group" {
  type        = bool
  description = "Whether to create CloudWatch log group for RDS logs"
  default     = false
}

variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  description = "List of log types to export to CloudWatch"
  default     = []
}

variable "multi_az" {
  type        = bool
  description = "Multi-AZ deployment"
  default     = false
}

variable "publicly_accessible" {
  type        = bool
  description = "Publicly accessible"
  default     = false
}

variable "db_name" {
  type        = string
  description = "Database name"
  default     = null
}

variable "username" {
  type        = string
  description = "Master username"
  sensitive   = true
}

variable "password" {
  type        = string
  description = "Master password"
  sensitive   = true
}

variable "port" {
  type        = number
  description = "Database port"
  default     = null
}

variable "backup_retention_period" {
  type        = number
  description = "Backup retention period (days)"
  default     = 7
}

variable "deletion_protection" {
  type        = bool
  description = "Deletion protection"
  default     = false
}

variable "storage_encrypted" {
  type        = bool
  description = "Enable storage encryption"
  default     = true
}

variable "kms_key_id" {
  type        = string
  description = "KMS key ID for storage encryption. When empty, the AWS managed key is used"
  default     = ""
}

variable "performance_insights_enabled" {
  type        = bool
  description = "Enable Performance Insights"
  default     = true
}

variable "performance_insights_kms_key_id" {
  type        = string
  description = "KMS key ID for Performance Insights. When empty, the AWS managed key is used"
  default     = ""
}

variable "performance_insights_retention_period" {
  type        = number
  description = "Performance Insights retention period in days"
  default     = 7
}

variable "iam_database_authentication_enabled" {
  type        = bool
  description = "Enable IAM database authentication"
  default     = false
}

variable "log_retention_in_days" {
  type        = number
  description = "Retention in days for the created CloudWatch log group"
  default     = 30
}

variable "copy_tags_to_snapshot" {
  type        = bool
  description = "Copy tags to snapshots"
  default     = true
}

variable "auto_minor_version_upgrade" {
  type        = bool
  description = "Enable automatic minor version upgrades"
  default     = true
}

variable "ca_cert_identifier" {
  type        = string
  description = "CA certificate identifier for the DB instance"
  default     = "rds-ca-rsa2048-g1"
}

variable "enable_deletion_protection" {
  type        = bool
  description = "Enable deletion protection for the DB instance"
  default     = true
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Skip final snapshot"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply"
  default     = {}
}

# ====================================
# Sigmoid Tags Configuration
# ====================================

variable "sigmoid_environment" {
  description = "Sigmoid environment identifier for cost allocation"
  type        = string
  default     = ""
}

variable "sigmoid_project" {
  description = "Sigmoid project identifier for cost allocation"
  type        = string
  default     = ""
}

variable "sigmoid_team" {
  description = "Sigmoid team identifier for cost allocation"
  type        = string
  default     = ""
}
