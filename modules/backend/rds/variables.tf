variable "general_tags" {
  type        = map(string)
  description = "Tags that is general for all resources"
}

variable "subnets" {
  description = "List os subnets ids"
  type        = list(string)
}

variable "rds_subnet_group_name" {
  description = "Name of the subnets group"
  type        = string
}

variable "database_name" {
  description = "Name of the database instance"
  type        = string
}

variable "database_engine" {
  description = "Database Engine"
  type        = string
}

variable "database_engine_version" {
  description = "Version of the database engine"
  type        = string
}

variable "instance_class" {
  description = "Class of the database instance"
  type        = string
}

variable "database_username" {
  description = "Username to use on the database"
  type        = string
}
variable "database_password" {
  description = "Password to use on the database"
  type        = string
}

variable "database_backup_retention" {
  description = "Number of days of backup retention"
  type        = string
}

variable "rds_instance_name" {
  description = "Name of database instance"
  type        = string
}

variable "security_group_id" {
  description = "ID of database security group"
  type        = string
}