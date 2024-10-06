output "igw_arn" {
  value       = aws_internet_gateway.igw.arn
  description = "ARN of the internet gateway"
}

output "igw_id" {
  value       = aws_internet_gateway.igw.id
  description = "ID of the internet gateway"
}