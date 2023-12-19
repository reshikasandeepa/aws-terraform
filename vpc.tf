data "aws_availability_zones" "available" {}

module "vpc" {
  source = "./modules/vpc"

  cidr = "10.0.0.0/16"

  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "dev-vpc"
    Environment = var.environment
  }
}

module "elastic_ip" {
    source = "./modules/elastic_ip"

    tags = {
        Name = "dev-eip"
        Environment = var.environment
  }
}

module "igw" {
    source = "./modules/igw"

    vpc_id = module.vpc.vpc_id
    
    tags = {
        Name = "dev-igw"
        Environment = var.environment
  }
}

module "ngw_subnet" {
  source = "./modules/subnet"

    vpc_id                  = module.vpc.vpc_id
    private_subnets         = ["10.0.5.0/24"]
    azs                     = [element(data.aws_availability_zones.available.names, 0), element(data.aws_availability_zones.available.names, 1)]
    create_single_subnet    = false
    map_public_ip_on_launch = true

    tags = {
        Name        = "ngw-public-subnet"
        Environment = var.environment
    }
}

module "ngw" {
    source = "./modules/ngw"

    subnet_id    = module.ngw_subnet.subnet_id[0]
    elasticip_id = module.elastic_ip.eip_id

    tags = {
        Name        = "ngw"
        Environment = var.environment
    }
}

module "private_rt" {
    source = "./modules/route_table"

    vpc_id = module.vpc.vpc_id

    subnet_id = [module.rds_subnet.subnet_id[0],module.rds_subnet.subnet_id[1]]
    routetable_id = module.private_rt.route_table_id

    tags = {
        Name        = "private-rt"
        Environment = var.environment
    }

    route_rules = [
        {
            cidr_block = "0.0.0.0/0"
            gateway_id = module.ngw.ngw_id
        }
    ]
}

module "public_rt" {
    source = "./modules/route_table"

    vpc_id = module.vpc.vpc_id

    subnet_id = [module.ngw_subnet.subnet_id[0]]
    routetable_id = module.public_rt.route_table_id

    tags = {
        Name        = "public-rt"
        Environment = var.environment
    }

    route_rules = [
        {
            cidr_block = "0.0.0.0/0"
            gateway_id = module.igw.igw_id
        }
    ]
}