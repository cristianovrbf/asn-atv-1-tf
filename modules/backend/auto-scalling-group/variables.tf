variable "subnets" {
  type        = list(string)
  description = "subnets"
}

variable "launch_template_id" {
  type        = string
  description = "ID of the launch template"
}

variable "general_tags" {
  type        = map(string)
  description = "Tags that is general for all resources"
}

variable "asg_name" {
  type        = string
  description = "Auto Scalling Group Name"
}

variable "desired_capacity" {
  type        = number
  description = "Auto Scalling Desired Capacity"
}

variable "max_size" {
  type        = number
  description = "Auto Scalling Max Size"
}

variable "min_size" {
  type        = number
  description = "Auto Scalling Min Size"
}