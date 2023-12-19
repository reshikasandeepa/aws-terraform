module "ecs_subnet" {
  source = "./modules/subnet"

    vpc_id                  = module.vpc.vpc_id
    private_subnets         = ["10.0.1.0/24", "10.0.2.0/24"]
    azs                     = [element(data.aws_availability_zones.available.names, 0), element(data.aws_availability_zones.available.names, 1)]
    create_single_subnet    = false
    map_public_ip_on_launch = false

    tags = {
        Name        = "private-subnet"
        Environment = var.environment
  }
}