resource "aws_security_group" "security_group" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  dynamic "egress" {
    for_each = var.security_group_egress_rules

    content {
      from_port       = egress.value.port
      to_port         = egress.value.port
      protocol        = egress.value.protocol
      cidr_blocks     = length(egress.value.cidr_blocks) > 0 ? egress.value.cidr_blocks : null
      security_groups = length(egress.value.security_groups) > 0 ? egress.value.security_groups : null
    }
  }

  dynamic "ingress" {
    for_each = var.security_group_ingress_rules

    content {
      from_port       = ingress.value.port
      to_port         = ingress.value.port
      protocol        = ingress.value.protocol
      cidr_blocks     = length(ingress.value.cidr_blocks) > 0 ? ingress.value.cidr_blocks : null
      security_groups = length(ingress.value.security_groups) > 0 ? ingress.value.security_groups : null
    }
  }

  tags = merge(
    var.general_tags,
    {
      Name = var.security_group_name
    }
  )
}

