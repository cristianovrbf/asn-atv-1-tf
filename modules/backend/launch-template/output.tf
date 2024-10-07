output "ami_id" {
  value = aws_launch_template.template.id
}

output "ami_arn" {
  value = aws_launch_template.template.arn
}