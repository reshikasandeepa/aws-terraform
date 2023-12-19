variable "name_prefix" {
    description = "Prefix of the NSG name"
    type = string
}

variable "description" {
    description = "Description for the NSG"
    type = string
}

variable "vpc_id" {
    description = "ID of the vpc"
    type = string
}

variable "ingress_rules" {
    description = "List of ingress rules"
    type = list (object({
        description = string
        from_port = number
        to_port = number
        protocol = string
        cidr_blocks = list(string)
        ipv6_cidr_blocks = list(string)
        security_groups = list(string)
        prefix_list_ids = list(string)
        self = bool
    }))
}

variable "egress_rules" {
    description = "List of egress rules"
    type = list (object({
        description = string
        from_port = number
        to_port = number
        protocol = string
        cidr_blocks = list(string)
        ipv6_cidr_blocks = list(string)
        security_groups = list(string)
        prefix_list_ids = list(string)
        self = bool
    }))
}

variable "tags"{
    description = "tags values to use in the environment"
    type = map(string)

    default = {
        Name = "main"
        Environment = "dev"
    }
}