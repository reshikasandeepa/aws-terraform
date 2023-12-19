resource "aws_db_subnet_group" "db_subnet_group" {
  name        = var.subnet_group_name
  description = var.subnet_group_description
  subnet_ids  = var.subnet_ids

  tags = var.tags
}