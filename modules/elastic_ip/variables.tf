variable "tags"{
    description = "tags values to use in the environment"
    type = map(string)

    default = {
        Name = "main"
        Environment = "dev"
    }
}