resource "aws_ecs_task_definition" "mongodb" {
  family                   = "mongodb"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  memory                   = "512"
  cpu                      = "256"

  container_definitions = jsonencode([
    {
      name      = "mongodb"
      image     = "mongo"
      essential = true

      portMappings = [
        {
          containerPort = 27017
          hostPort      = 27017
        }
      ]
      mountPoints = [
        {
          sourceVolume  = "mongodb_data"
          containerPath = "/data/db"
        }
      ]
    }
  ])

  volume {
    name      = "mongodb_data"
    host_path = "/mnt/data"
  }
}

resource "aws_ecs_service" "mongodb" {
  name            = "mongodb-service"
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.mongodb.arn
  desired_count   = 1

  network_configuration {
    subnets         = var.subnet_ids
    security_groups = [var.security_group_id]
  }

  launch_type = "FARGATE"
}
