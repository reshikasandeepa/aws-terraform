variable "vpc_id" {
    type = string
    description = "The ID of the VPC where the route table should be created."
}

variable "route_rules" {
  description = "List of route rules"
  type        = list(object({
    cidr_block = string
    gateway_id = string
  }))
  default     = []
}

variable "subnet_id" {
    type        = list(string)
    description = "subnet id"
}

variable "routetable_id" {
    type =  string
    description = "route table id"
}


variable "tags" {
    description = "tags values to use in environment"
    type = map(string) 
    default = {
        Environment = "dev"
        Name = "main"
    }
}