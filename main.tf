module "vpc_main" {
  source         = "./modules/connectivity/vpc"
  vpc_cidr_block = "172.31.0.0/16"
  vpc_name       = "${local.common_tags.Project}-${local.common_tags.Pair}-vpc"
  general_tags   = local.common_tags
}

