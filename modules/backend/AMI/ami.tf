resource "aws_instance" "temporary_instance" {
  ami                    = var.original_ami
  instance_type          = var.ec2_instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_ids
  user_data              = file("${path.module}/init-script.sh")

  tags = merge(
    var.general_tags,
    {
      Name = var.ec2_instance_name
    }
  )
}

resource "aws_ami_from_instance" "ami" {
  name               = var.ami_name
  source_instance_id = aws_instance.temporary_instance.id
  description        = var.ami_description

  tags = merge(
    var.general_tags,
    {
      Name = var.ami_name
    }
  )

  depends_on = [aws_instance.temporary_instance]
}

resource "null_resource" "terminate_instance" {

  provisioner "local-exec" {
    command = "aws ec2 terminate-instances --instance-ids ${aws_instance.temporary_instance.id} --region ca-central-1"
  }

  triggers = {
    ami_creation = aws_ami_from_instance.ami.id
  }
}

