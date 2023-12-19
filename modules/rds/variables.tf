variable "allocated_storage" {
  description = "The amount of allocated storage in gibibytes (GiB)"
  type        = number
}

variable "storage_type" {
  description = "The storage type for the RDS instance (e.g., 'gp2', 'io1')"
  type        = string
}

variable "db_name" {
  description = "The name of the initial database to create when the RDS instance is launched"
  type        = string
}

variable "db_instance_identifier" {
  description = "RDS database identifier"
  type        = string
}

variable "db_engine" {
  description = "The name of the database engine to be used for this RDS instance (e.g., 'mysql', 'postgres')"
  type        = string
}

variable "engine_version" {
  description = "The version of the database engine to be used for this RDS instance (e.g., '5.7', '9.6')"
  type        = string
}

variable "instance_class" {
  description = "The instance class of the RDS instance (e.g., 'db.t2.micro', 'db.m4.large')"
  type        = string
}

variable "username" {
  description = "The master username for the RDS instance"
  type        = string
}

variable "password" {
  description = "The master password for the RDS instance"
  type        = string
}

variable "sg" {
  description = "A list of security group IDs to associate with the RDS instance"
  type        = list(string)
}

variable "subnet_group_name" {
  description = "Name for the DB subnet group."
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  type        = number
  default     = null
}

variable "backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  type        = string
  default     = null
}

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  type        = bool
  default     = true
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  type        = bool
  default     = false
}

variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  type        = string
  default     = null
}

variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true."
  type        = bool
}

variable "delete_automated_backups" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted"
  type        = bool
  default     = true
}

variable "tags" {
    description = "tags values to use in environment"
    type = map(string) 
    default = {
        Environment = "dev"
        Name = "main"
    }
}
