# Module: RDS

This module manages an Amazon RDS instance, supporting various database engines, storage configurations, and high availability options.

## Features
- RDS Instance creation with multiple engine support
- Storage configuration (Allocated size, Type, Encryption)
- Networking (Subnet group, Security groups, Public access)
- Multi-AZ deployment for high availability
- Performance Insights and Monitoring
- Backup retention and Deletion protection

## Usage
```hcl
module "rds" {
  source = "../../terraform-modules/terraform-aws-rds"

  identifier           = "my-db-instance"
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  db_subnet_group_name = "my-db-subnet-group"
  username             = "admin"
  password             = "password123"
}
```

## Inputs
| Name | Type | Default | Description |
|------|------|---------|-------------|
| `identifier` | `string` | n/a | RDS identifier |
| `engine` | `string` | n/a | Database engine |
| `engine_version` | `string` | `null` | Database engine version |
| `instance_class` | `string` | n/a | Instance class |
| `allocated_storage` | `number` | `20` | Allocated storage (GB) |
| `storage_type` | `string` | `"gp3"` | Storage type |
| `db_subnet_group_name` | `string` | n/a | DB subnet group name |
| `vpc_security_group_ids` | `list(string)` | `[]` | VPC security group IDs |
| `multi_az` | `bool` | `false` | Multi-AZ deployment |
| `publicly_accessible` | `bool` | `false` | Publicly accessible |
| `db_name` | `string` | `null` | Database name |
| `username` | `string` | n/a | Master username |
| `password` | `string` | n/a | Master password |
| `port` | `number` | `null` | Database port |
| `backup_retention_period` | `number` | `7` | Backup retention period (days) |
| `deletion_protection` | `bool` | `false` | Deletion protection |
| `storage_encrypted` | `bool` | `true` | Enable storage encryption |
| `kms_key_id` | `string` | `null` | KMS key ID |
| `performance_insights_enabled` | `bool` | `false` | Enable Performance Insights |
| `skip_final_snapshot` | `bool` | `false` | Skip final snapshot |
| `tags` | `map(string)` | `{}` | Tags to apply |

## Outputs
| Name | Description |
|------|-------------|
| `db_instance_id` | RDS instance ID |
| `endpoint` | RDS endpoint |
| `module` | Full module outputs |

## Environment Variables
None

## Notes
- `username` and `password` are sensitive and should be handled securely.
- Ensure the subnet group and security groups allow access on the database port.
- Multi-AZ is recommended for production environments.
