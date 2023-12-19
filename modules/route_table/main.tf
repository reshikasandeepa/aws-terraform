resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id

  tags = var.tags
}

resource "aws_route" "route" {
  count           = length(var.route_rules)
  route_table_id  = aws_route_table.route_table.id
  destination_cidr_block = var.route_rules[count.index].cidr_block
  gateway_id      = var.route_rules[count.index].gateway_id
}

resource "aws_route_table_association" "subnet_associations" {
  count          = length(var.subnet_id)
  subnet_id      = var.subnet_id[count.index]
  route_table_id = var.routetable_id
}