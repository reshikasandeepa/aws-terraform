output "db_subnet_group_id" {
  description = "The ID of the created DB subnet group."
  value       = aws_db_subnet_group.db_subnet_group.id
}