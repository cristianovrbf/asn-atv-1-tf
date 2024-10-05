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

