variable "cluster_id" {
  description = "L'ID du cluster ECS"
  type        = string
}

variable "security_group_id" {
  description = "L'ID du groupe de sécurité"
  type        = string
}

variable "subnet_ids" {
  description = "Les IDs des sous-réseaux"
  type        = list(string)
}
