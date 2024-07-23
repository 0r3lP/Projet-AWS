variable "project_name" {
  description = "Le nom du projet"
  type        = string
  default     = "mongodb-ecs-fargate"
}

variable "vpc_id" {
  description = "ID du VPC où le cluster ECS sera déployé"
  type        = string
}
