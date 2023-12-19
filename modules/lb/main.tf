resource "aws_lb" "lb" {
  name               = var.lb_name
  internal           = var.internal
  load_balancer_type = var.lb_type
  enable_http2       = true
  enable_deletion_protection = var.enable_deletion_protection

  subnets = var.subnets

  security_groups = var.security_group_id

  enable_cross_zone_load_balancing = true

  tags = var.tags
}
