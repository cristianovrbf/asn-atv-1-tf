variable "general_tags" {
  type        = map(string)
  description = "Tags that is general for all resources"
}

variable "vpc_name" {
  type        = string
  description = "Name for VPC"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR Block for VPC"
}