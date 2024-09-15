# ECS Service for Expense Tracker
resource "aws_ecs_service" "expense_tracker_service" {
  name            = "expense-tracker-service"
  cluster         = aws_ecs_cluster.expense_tracker_cluster.id
  task_definition = aws_ecs_task_definition.expense_tracker_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1
  network_configuration {
    subnets         = module.vpc.private_subnets
    security_groups = [aws_security_group.ecs_sg.id]
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.expense_tracker_tg.arn
    container_name   = "prod"
    container_port   = 3000
  }
}
