variable "subnet_id" {
  description = "ID of the subnet to be associated on the route table"
  type        = string
}

variable "route_table_id" {
  description = "ID of the route table to associate the subnet"
  type        = string
}