output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = concat(aws_subnet.public[*].id, aws_subnet.private[*].id)
}

output "availability_zones" {
  value = data.aws_availability_zones.available.names
}
