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
