variable "lb_name" {
  description = "Name for the ALB"
  type        = string
}

variable "internal" {
  description = "Whether the ALB is internal (true/false)"
  type = bool
}

variable "subnets" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "security_group_id" {
  description = "ID of the security group for the ALB"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection for the ALB"
  default     = false
}

variable "lb_type" {
    description = "load balacner type application/network"
    type = string
}

variable "tags" {
    description = "tags values to use in environment"
    type = map(string) 
    default = {
        Environment = "dev"
        Name = "main"
    }
}
