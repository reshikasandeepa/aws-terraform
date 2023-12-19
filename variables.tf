variable "environment" {
    type = string
    default = "dev"
}


######## RDS #########

variable "rds_allocated_storage" {
    type = number
    default = 20
}
variable "rds_storage_type" {
    type = string
    default = "gp2"
}

variable "rds_db_name" {
    type = string
    default = "app"
}

variable "db_instance_identifier" {
    type = string
    default = "app-dev"
}

variable "rds_db_engine" {
    type = string
    default = "mysql"
}

variable "rds_engine_version" {
    type = string
    default = "8.0"
}

variable "rds_instance_class" {
    type = string
    default = "db.t3.micro"
}

variable "rds_username" {
    type = string
    default = "admin"
}

variable "rds_password" {
    type = string
    default = "5VCQ137HHdA5fotX2S"
}

variable "subnet_group_name" {
    type = string
    default = "rds_subnet_group"
}

variable "subnet_group_description" {
    type = string
    default = "RDS Subnet Group"
}