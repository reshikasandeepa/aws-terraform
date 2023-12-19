output "rds_id" {
  description = "The ID of the created EC2."
  value       = aws_db_instance.rds.id
}
