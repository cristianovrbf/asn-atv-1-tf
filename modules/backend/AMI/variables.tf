variable "original_ami" {
  type        = string
  description = "ID of the original AMI"
}

variable "ec2_instance_type" {
  type        = string
  description = "Instance Type"
}

variable "ec2_instance_name" {
  type        = string
  description = "Instance Name"
}

variable "general_tags" {
  type        = map(string)
  description = "Tags that is general for all resources"
}

variable "ami_name" {
  type        = string
  description = "AMI Name"
}

variable "ami_description" {
  type        = string
  description = "AMI description"
}

variable "subnet_id" {
  type        = string
  description = "Instance subnet id"
}

variable "security_ids" {
  type        = list(string)
  description = "List of security groups"
}