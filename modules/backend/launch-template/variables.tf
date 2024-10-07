variable "launch_template_name" {
  type        = string
  description = "Name of the launch template"
}

variable "ami_id" {
  type        = string
  description = "ID of the AMI that will be used in the launch template"
}

variable "instance_type" {
  type        = string
  description = "Instance type that will be used in the launch template"
}

variable "availability_zone" {
  type        = string
  description = "AZ where the instance created by the launch template will be initialized"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "security group ids to use on instances"
}

variable "general_tags" {
  type        = map(string)
  description = "Tags that is general for all resources"
}

variable "launch_template_instance_name" {
  type        = string
  description = "Name of the instances that will be created by launch template"
}