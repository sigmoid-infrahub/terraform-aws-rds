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
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "VPC security group IDs"
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
  description = "KMS key ID"
  default     = null
}

variable "performance_insights_enabled" {
  type        = bool
  description = "Enable Performance Insights"
  default     = false
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
