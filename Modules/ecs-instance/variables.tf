variable "ami" {
  description = "AMI ID de l'instance EC2"
  type        = string
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  default     = "t2.micro"
}

variable "subnet_ids" {
  description = "Les IDs des sous-réseaux"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID du VPC"
  type        = string
}
