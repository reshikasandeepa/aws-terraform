output "subnet_id" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private[*].id
}

output "subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = aws_subnet.private[*].arn
}