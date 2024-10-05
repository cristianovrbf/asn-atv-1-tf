output "subnet_main_id" {
  description = "ID of the subnet_main"
  value       = aws_subnet.subnet_main.id
}

output "subnet_main_cidr_block" {
  description = "CIDR block of the subnet_main"
  value       = aws_subnet.subnet_main.cidr_block
}

output "subnet_main_arn" {
  description = "ARN of the subnet_main"
  value       = aws_subnet.subnet_main.arn
}