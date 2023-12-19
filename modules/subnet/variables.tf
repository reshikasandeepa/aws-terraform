variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string) 
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
}


variable "vpc_id" {
    description = "vpc needs subnet should create"
    type = string
}

variable "create_single_subnet" {
    description = "multiple subnets in multiple az"
    type = bool
    default = true
}

variable "map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is `false`"
  type        = bool
  default     = false
}

variable "tags"{
    description = "tags values to use in the environment"
    type = map(string)

    default = {
        Environment = "dev"
        Name = "subnet"
    }

  }