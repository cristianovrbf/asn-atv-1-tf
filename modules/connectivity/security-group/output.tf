output "security_group_arn" {
  value       = aws_security_group.security_group.arn
  description = "ARN of the Security Group"
}

output "security_group_id" {
  value       = aws_security_group.security_group.id
  description = "ID of the Security Group"
}