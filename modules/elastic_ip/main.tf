resource "aws_eip" "eip" {
    domain = "vpc"
    tags = var.tags
}