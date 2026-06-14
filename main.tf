resource "aws_instance" "runner" {
    ami                     = local.ami_id
    instance_type           = "t3.small"
    vpc_security_group_ids  = [aws_security_group.main.id]
    subnet_id              = local.private_subnet_id
    vpc_id                   = local.vpc_id

    root_block_device {
      volume_size = 50
      volume_type = "gp3"
    }
    
    user_data = file("runner.sh")


    tags = merge(
    local.common_tags,
    {
      Name = "runner"
    }
  )
}

resource "aws_security_group" "main" {
  name        = "${local.common_name}-runner-sg"
  description = "Allow all inbound and outbound traffic"

  ingress {
    description = "Allow all inbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "runner-sg"
    }
  )
}