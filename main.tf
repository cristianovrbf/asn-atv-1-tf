module "vpc_main" {
  source         = "./modules/connectivity/vpc"
  vpc_cidr_block = "172.31.0.0/16"
  vpc_name       = "${local.common_tags.Project}-${local.common_tags.Pair}-vpc"
  general_tags   = local.common_tags
}

module "subnet_private_1a" {
  source                   = "./modules/connectivity/subnet"
  vpc_id                   = module.vpc_main.vpc_id
  subnet_cidr_block        = cidrsubnet(module.vpc_main.vpc_cidr_block, 8, 1)
  subnet_availability_zone = "${local.region}a"
  is_public                = false

  subnet_name  = "${local.common_tags.Project}-${local.common_tags.Pair}-private-subnet-1a"
  general_tags = local.common_tags
}

module "subnet_private_1b" {
  source                   = "./modules/connectivity/subnet"
  vpc_id                   = module.vpc_main.vpc_id
  subnet_cidr_block        = cidrsubnet(module.vpc_main.vpc_cidr_block, 8, 2)
  subnet_availability_zone = "${local.region}b"
  is_public                = false

  subnet_name  = "${local.common_tags.Project}-${local.common_tags.Pair}-private-subnet-1b"
  general_tags = local.common_tags
}

module "subnet_public_1d" {
  source                   = "./modules/connectivity/subnet"
  vpc_id                   = module.vpc_main.vpc_id
  subnet_cidr_block        = cidrsubnet(module.vpc_main.vpc_cidr_block, 8, 3)
  subnet_availability_zone = "${local.region}d"
  is_public                = true

  subnet_name  = "${local.common_tags.Project}-${local.common_tags.Pair}-public-subnet-1d"
  general_tags = local.common_tags
}

module "subnet_public_1b" {
  source                   = "./modules/connectivity/subnet"
  vpc_id                   = module.vpc_main.vpc_id
  subnet_cidr_block        = cidrsubnet(module.vpc_main.vpc_cidr_block, 8, 4)
  subnet_availability_zone = "${local.region}b"
  is_public                = true

  subnet_name  = "${local.common_tags.Project}-${local.common_tags.Pair}-public-subnet-1b"
  general_tags = local.common_tags
}

module "public_instance_security_group" {
  source                     = "./modules/connectivity/security-group"
  security_group_name        = "${local.common_tags.Project}-${local.common_tags.Pair}-public-instance-sg"
  security_group_description = "Allows traffic on port 80 came from internet"
  vpc_id                     = module.vpc_main.vpc_id
  security_group_egress_rules = [
    {
      port            = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
      security_groups = []
    }
  ]
  security_group_ingress_rules = [
    {
      port            = 80
      protocol        = "TCP"
      cidr_blocks     = ["0.0.0.0/0"]
      security_groups = []
    }
  ]
  general_tags = local.common_tags
}

module "private_instance_security_group" {
  source                     = "./modules/connectivity/security-group"
  security_group_name        = "${local.common_tags.Project}-${local.common_tags.Pair}-private-instance-sg"
  security_group_description = "Allows traffic on port 80 came from public instance security group"
  vpc_id                     = module.vpc_main.vpc_id
  security_group_egress_rules = [
    {
      port            = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
      security_groups = []
    }
  ]
  security_group_ingress_rules = [
    {
      port            = 80
      protocol        = "TCP"
      cidr_blocks     = []
      security_groups = [module.public_instance_security_group.security_group_id]
    }
  ]
  general_tags = local.common_tags
}

module "rds_security_group" {
  source                     = "./modules/connectivity/security-group"
  security_group_name        = "${local.common_tags.Project}-${local.common_tags.Pair}-rds-private-instance"
  security_group_description = "Allows traffic on port 3306 came from private instance security group"
  vpc_id                     = module.vpc_main.vpc_id
  security_group_egress_rules = [
    {
      port            = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
      security_groups = []
    }
  ]
  security_group_ingress_rules = [
    {
      port            = 3306
      protocol        = "TCP"
      cidr_blocks     = []
      security_groups = [module.private_instance_security_group.security_group_id]
    }
  ]
  general_tags = local.common_tags
}

module "alb_security_group" {
  source                     = "./modules/connectivity/security-group"
  security_group_name        = "${local.common_tags.Project}-${local.common_tags.Pair}-application-load-balancer-sg"
  security_group_description = "Allows traffic on port 80 came from internet"
  vpc_id                     = module.vpc_main.vpc_id
  security_group_egress_rules = [
    {
      port            = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
      security_groups = []
    }
  ]
  security_group_ingress_rules = [
    {
      port            = 80
      protocol        = "TCP"
      cidr_blocks     = ["0.0.0.0/0"]
      security_groups = []
    }
  ]
  general_tags = local.common_tags
}

module "igw" {
  source       = "./modules/connectivity/internet-gateway"
  igw_name     = "${local.common_tags.Project}-${local.common_tags.Pair}-igw"
  vpc_id       = module.vpc_main.vpc_id
  general_tags = local.common_tags
}

module "vpc_route_tables" {
  source                   = "./modules/connectivity/route-table"
  public_route_table_name  = "${local.common_tags.Project}-${local.common_tags.Pair}-public-route-table"
  private_route_table_name = "${local.common_tags.Project}-${local.common_tags.Pair}-private-route-table"
  vpc_id                   = module.vpc_main.vpc_id
  igw_id                   = module.igw.igw_id
  general_tags             = local.common_tags
}

module "subnet_private_1a_route_table_association" {
  source         = "./modules/connectivity/route-table-association"
  subnet_id      = module.subnet_private_1a.subnet_main_id
  route_table_id = module.vpc_route_tables.private_route_table_id
}

module "subnet_private_1b_route_table_association" {
  source         = "./modules/connectivity/route-table-association"
  subnet_id      = module.subnet_private_1b.subnet_main_id
  route_table_id = module.vpc_route_tables.private_route_table_id
}

module "subnet_public_1d_route_table_association" {
  source         = "./modules/connectivity/route-table-association"
  subnet_id      = module.subnet_public_1d.subnet_main_id
  route_table_id = module.vpc_route_tables.public_route_table_id
}

module "subnet_public_1b_route_table_association" {
  source         = "./modules/connectivity/route-table-association"
  subnet_id      = module.subnet_public_1b.subnet_main_id
  route_table_id = module.vpc_route_tables.public_route_table_id
}

module "launch_template" {
  source                        = "./modules/backend/launch-template"
  launch_template_name          = "${local.common_tags.Project}-${local.common_tags.Pair}-apache-launch-template"
  ami_id                        = "ami-06c00e6a6b7028ea5"
  instance_type                 = "t2.micro"
  availability_zone             = "${local.region}b"
  vpc_security_group_ids        = [module.private_instance_security_group.security_group_id]
  general_tags                  = local.common_tags
  launch_template_instance_name = "${local.common_tags.Project}-${local.common_tags.Pair}-apache-launch-template-instance"
}

module "auto_scalling_group" {
  source             = "./modules/backend/auto-scalling-group"
  subnets            = [module.subnet_public_1d.subnet_main_id]
  launch_template_id = module.launch_template.launch_template_id
  general_tags       = local.common_tags
  asg_name           = "${local.common_tags.Project}-${local.common_tags.Pair}-auto-scalling-group"
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1
}

module "application_load_balancer" {
  source                    = "./modules/backend/application-load-balancer"
  alb_name                  = "${local.common_tags.Project}-${local.common_tags.Pair}-alb"
  alb_sg_id                 = module.public_instance_security_group.security_group_id
  subnets                   = [module.subnet_public_1d.subnet_main_id, module.subnet_public_1b.subnet_main_id]
  alb_main_targe_group_name = "${local.common_tags.Project}-${local.common_tags.Pair}-tg"
  vpc_id                    = module.vpc_main.vpc_id
  autoscaling_group_name    = module.auto_scalling_group.auto_scalling_group_name
}