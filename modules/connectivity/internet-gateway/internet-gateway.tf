resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = merge(
    var.general_tags,
    {
      Name = var.igw_name
    }
  )
}