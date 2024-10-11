resource "aws_launch_template" "template" {
  name          = var.launch_template_name
  image_id      = var.ami_id
  instance_type = var.instance_type

  placement {
    availability_zone = var.availability_zone
  }

  vpc_security_group_ids = var.vpc_security_group_ids

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      var.general_tags,
      {
        Name = var.launch_template_instance_name
      }
    )
  }

  user_data = filebase64("${path.module}/init-docker.sh")
}