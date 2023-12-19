variable "vpc_id" {
    type =  string
    description = "vpc id"
}

variable "tags" {
    description = "tags values to use in environment"
    type = map(string) 
    default = {
        Environment = "dev"
        Name = "main"
    }
}