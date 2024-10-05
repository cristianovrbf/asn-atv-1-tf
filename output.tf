output "vpc_main_id" {
  description = "ID of the VPC"
  value       = module.vpc_main.vpc_id
}

output "vpc_main_cidr_block" {
  description = "CIDR block of the VPC"
  value       = module.vpc_main.vpc_cidr_block
}

output "vpc_main_arn" {
  description = "ARN of the VPC"
  value       = module.vpc_main.vpc_arn
}

output "subnet_private_1a_id" {
  description = "ID of the VPC"
  value       = module.subnet_private_1a.subnet_main_id
}

output "subnet_private_1a_cidr_block" {
  description = "CIDR block of the VPC"
  value       = module.subnet_private_1a.subnet_main_cidr_block
}

output "subnet_private_1a_arn" {
  description = "ARN of the VPC"
  value       = module.subnet_private_1a.subnet_main_arn
}

output "subnet_private_1b_id" {
  description = "ID of the VPC"
  value       = module.subnet_private_1b.subnet_main_id
}

output "subnet_private_1b_cidr_block" {
  description = "CIDR block of the VPC"
  value       = module.subnet_private_1b.subnet_main_cidr_block
}

output "subnet_private_1b_arn" {
  description = "ARN of the VPC"
  value       = module.subnet_private_1b.subnet_main_arn
}

output "subnet_public_1d_id" {
  description = "ID of the VPC"
  value       = module.subnet_public_1d.subnet_main_id
}

output "subnet_public_1d_cidr_block" {
  description = "CIDR block of the VPC"
  value       = module.subnet_public_1d.subnet_main_cidr_block
}

output "subnet_public_1d_arn" {
  description = "ARN of the VPC"
  value       = module.subnet_public_1d.subnet_main_arn
}
