module "rds_subnet" {
  source = "./modules/subnet"

    vpc_id                  = module.vpc.vpc_id
    private_subnets         = ["10.0.3.0/24", "10.0.4.0/24"]
    azs                     = [element(data.aws_availability_zones.available.names, 0), element(data.aws_availability_zones.available.names, 1)]
    create_single_subnet    = false
    map_public_ip_on_launch = false

    tags = {
        Name        = "rds-subnet"
        Environment = var.environment
  }
}

module "rds_nsg" {
  source = "./modules/nsg"

  name_prefix   = "rds-nsg-"
  description   = "Network Security Group for RDS"
  vpc_id        = module.vpc.vpc_id

  ingress_rules = [
    {
      description = "Allow sql inbound traffic to rds"
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress_rules = [
    {
      description = "Allow all outbound traffic from port 80"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description = "Allow all outbound traffic from port 443"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
      Environment = var.environment
      Name = "rds-nsg"
  }
}

module "rds_subnet_group" {
  source = "./modules/subnet_groups"
  subnet_group_description = var.subnet_group_description
  subnet_group_name = var.subnet_group_name

  subnet_ids = [
    module.rds_subnet.subnet_id[0],
    module.rds_subnet.subnet_id[1]
  ]
}


module "rds" {
  source = "./modules/rds"

  allocated_storage = var.rds_allocated_storage
  storage_type = var.rds_storage_type
  db_name = var.rds_db_name
  db_instance_identifier = var.db_instance_identifier
  db_engine = var.rds_db_engine
  engine_version = var.rds_engine_version
  instance_class = var.rds_instance_class
  username = var.rds_username
  password = var.rds_password
  sg = [module.rds_nsg.nsg_id]
  
  subnet_group_name = var.subnet_group_name

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  deletion_protection = true

  tags = {
      Environment = var.environment
      Name = "rds"
  }

}