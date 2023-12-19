variable "subnet_group_description" {
  description = "Description for the DB subnet group."
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group."
  type        = list(string)
}

variable "subnet_group_name" {
  description = "Name for the DB subnet group."
}

variable "tags" {
    description = "tags values to use in environment"
    type = map(string) 
    default = {
        Environment = "dev"
        Name = "main"
    }
}