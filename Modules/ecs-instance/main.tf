resource "aws_instance" "mongodb_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_ids, 0)

  tags = {
    Name = "mongodb_instance"
  }

  root_block_device {
    volume_size = 10
  }

  volume_tags = {
    Name = "mongodb_instance_volume"
  }
}

resource "aws_security_group" "mongodb_instance_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "allow_ssh" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]
  security_group_id = aws_security_group.mongodb_instance_sg.id
}
