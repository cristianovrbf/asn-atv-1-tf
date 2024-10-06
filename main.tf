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
  security_group_name        = "${local.common_tags.Project}-${local.common_tags.Pair}-sg-private-instance"
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