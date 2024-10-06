variable "general_tags" {
  type        = map(string)
  description = "Tags that is general for all resources"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "igw_id" {
  type        = string
  description = "ID of the Internet Gateway"
}

variable "public_route_table_name" {
  type        = string
  description = "Name of the public route table"
}

variable "private_route_table_name" {
  type        = string
  description = "Name of the private route table"
}