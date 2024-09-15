# ECS Cluster for Expense Tracker
resource "aws_ecs_cluster" "expense_tracker_cluster" {
  name = "expense-tracker-cluster"
}

# ECS Task Definition for Expense Tracker
resource "aws_ecs_task_definition" "expense_tracker_task" {
  family                   = "expense-tracker-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"

  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn # Add this line

  container_definitions = jsonencode([
    {
      name      = "prod"
      image     = "${aws_ecr_repository.expense_tracker_repo.repository_url}:latest"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [{
        containerPort = 3000
        hostPort      = 3000
      }]
      environment = [
        { name = "DATABASE_HOST", value = "postgres" },
        { name = "DATABASE_USERNAME", value = var.db_username },
        { name = "DATABASE_PASSWORD", value = var.db_password },
        { name = "DATABASE_NAME", value = var.db_name },
        { name = "PORT", value = "3000" }
      ]
    },
    {
      name      = "postgres"
      image     = "postgres:14.1"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [{
        containerPort = 5432
        hostPort      = 5432
      }]
      environment = [
        { name = "POSTGRES_USER", value = var.db_username },
        { name = "POSTGRES_PASSWORD", value = var.db_password },
        { name = "POSTGRES_DB", value = var.db_name }
      ]
    }
  ])
}
