# ALB for Expense Tracker
resource "aws_lb" "expense_tracker_lb" {
  name               = "expense-tracker-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = module.vpc.public_subnets
}

resource "aws_lb_target_group" "expense_tracker_tg" {
  name        = "expense-tracker-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id
  target_type = "ip" # Update this to 'ip' to work with awsvpc network mode

  health_check {
    path = "/"
    port = "traffic-port"
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.expense_tracker_lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.expense_tracker_tg.arn
  }
}
