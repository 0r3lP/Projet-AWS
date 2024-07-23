resource "aws_ebs_volume" "mongodb_data" {
  availability_zone = var.availability_zone
  size              = var.volume_size
  tags = {
    Name = "mongodb_data"
  }
}

resource "aws_volume_attachment" "mongodb_attach" {
  device_name = "/dev/xvdb"
  volume_id   = aws_ebs_volume.mongodb_data.id
  instance_id = var.instance_id
  force_detach = true
}
