resource "aws_subnet" "subnet_main" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.subnet_availability_zone
  map_public_ip_on_launch = var.is_public

  tags = merge(
    var.general_tags,
    {
      Name = var.subnet_name
    }
  )
}