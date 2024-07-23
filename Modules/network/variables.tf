variable "region" {
  description = "La région AWS où déployer les ressources"
  type        = string
  default     = "us-east-1"
}

data "aws_availability_zones" "available" {}
