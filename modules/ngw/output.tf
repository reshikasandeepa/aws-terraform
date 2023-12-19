output "ngw_id" {
  description = "The ID of the created NGW."
  value       = aws_nat_gateway.ngw.id
}