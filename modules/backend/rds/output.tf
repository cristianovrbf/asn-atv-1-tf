output "rds_endpoint" {
  description = "DNS of the database"
  value       = aws_db_instance.rds_instance.endpoint
}

output "rds_arn" {
  description = "ARN of the database"
  value       = aws_db_instance.rds_instance.arn
}

output "rds_instance_id" {
  description = "ID of the database"
  value       = aws_db_instance.rds_instance.id
}

output "rds_instance_name" {
  description = "Name of the database"
  value       = aws_db_instance.rds_instance.db_name
}

