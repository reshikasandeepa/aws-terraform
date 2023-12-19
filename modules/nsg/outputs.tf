output "nsg_id" {
    description = "The ID of the created NSG"
    value = aws_security_group.nsg.id
}