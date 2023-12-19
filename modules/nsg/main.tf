resource "aws_security_group" "nsg" {
    name_prefix = var.name_prefix
    description = var.description
    vpc_id = var.vpc_id

    ingress = var.ingress_rules
    egress = var.egress_rules

    tags = var.tags
}