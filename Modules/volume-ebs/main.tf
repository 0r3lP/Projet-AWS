resource "aws_ebs_volume" "mongodb_data" {
  availability_zone = element(data.aws_availability_zones.available.names, 0)
  size              = 10
}
