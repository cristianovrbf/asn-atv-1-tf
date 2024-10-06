output "private_route_table_arn" {
  value       = aws_route_table.private_route_table.arn
  description = "ARN of the private route table"
}

output "private_route_table_id" {
  value       = aws_route_table.private_route_table.id
  description = "ID of the private route table"
}

output "public_route_table_arn" {
  value       = aws_route_table.public_route_table.arn
  description = "ARN of the public route table"
}

output "public_route_table_id" {
  value       = aws_route_table.public_route_table.id
  description = "ID of the public route table"
}