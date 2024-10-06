variable "general_tags" {
  type        = map(string)
  description = "Tags that is general for all resources"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "igw_name" {
  type        = string
  description = "Name of the internet gateway"
}