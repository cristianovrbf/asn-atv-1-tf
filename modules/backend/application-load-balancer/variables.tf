variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}
variable "alb_sg_id" {
  description = "ID of the Security Group of the Application Load Balancer"
  type        = string
}
variable "subnets" {
  description = "Subnets of the Application Load Balancer"
  type        = list(string)
}
variable "alb_main_targe_group_name" {
  description = "Name of the target group of the Application Load Balancer"
  type        = string
}
variable "vpc_id" {
  description = "ID of the VPC of the Application Load Balancer"
  type        = string
}
variable "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group that will be attached on Application Load Balancer"
  type        = string
}