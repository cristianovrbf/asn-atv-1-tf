resource "aws_autoscaling_group" "asg" {
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  vpc_zone_identifier = var.subnets

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

}