variable "general_tags" {
  type        = map(string)
  description = "Tags that is general for all resources"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "security_group_name" {
  type        = string
  description = "Security Group Name"
}

variable "security_group_description" {
  type        = string
  description = "Security Group Description"
}

variable "security_group_egress_rules" {
  description = "List of Security Group egress rules"
  type = list(object({
    port            = number
    protocol        = string
    cidr_blocks     = list(string)
    security_groups = list(string)
  }))
}

variable "security_group_ingress_rules" {
  description = "List of Security Group ingress rules"
  type = list(object({
    port            = number
    protocol        = string
    cidr_blocks     = list(string)
    security_groups = list(string)
  }))
}

