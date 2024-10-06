resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = merge(
    var.general_tags,
    {
      Name = var.public_route_table_name
    }
  )
}

resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id

  tags = merge(
    var.general_tags,
    {
      Name = var.private_route_table_name
    }
  )
}