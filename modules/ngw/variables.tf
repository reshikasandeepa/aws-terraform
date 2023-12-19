variable "subnet_id" {
    type        = string
    description = "subnet id"
}

variable "elasticip_id" {
    type = string
    description = "elastic ip id"
}

variable "tags" {
    description = "tags values to use in environment"
    type = map(string) 
    default = {
        Environment = "dev"
        Name = "main"
    }
}