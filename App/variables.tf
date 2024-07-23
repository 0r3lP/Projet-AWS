variable "vpc_id" {
  description = "ID du VPC où le cluster ECS sera déployé"
  type        = string
  default     = "module.network.vpc_id"
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile"
  default     = "default"
}
