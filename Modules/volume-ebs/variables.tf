variable "volume_size" {
  description = "Taille du volume EBS en Go"
  type        = number
  default     = 2
}

variable "instance_id" {
  description = "ID de l'instance EC2 à attacher au volume"
  type        = string
}

variable "availability_zone" {
  description = "La zone de disponibilité dans laquelle créer le volume EBS"
}

