variable "general_tags" {
  type        = map(string)
  description = "Tags that is general for all resources"
}

variable "subnet_name" {
  type        = string
  description = "Name for subnet_name"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "subnet_cidr_block" {
  type        = string
  description = "CIDR Block for subnet"
}

variable "subnet_availability_zone" {
  type        = string
  description = "AZ for subnet"
}

variable "is_public" {
  type        = bool
  description = "Info about public/private of some resource"
}