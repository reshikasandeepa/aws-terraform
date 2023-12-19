resource "aws_subnet" "private" {

    count = var.create_single_subnet ? 1 : length(var.private_subnets)

    availability_zone       = var.create_single_subnet ? var.azs[0] : var.azs[count.index]
    cidr_block              = var.create_single_subnet ? var.private_subnets[0] : var.private_subnets[count.index]
    vpc_id                  = var.vpc_id
    map_public_ip_on_launch = var.map_public_ip_on_launch

    tags = merge(
    var.tags,
    {
      "Name" = var.create_single_subnet ? "private-subnet" : "private-subnet-${count.index + 1}"
    }
  )
}