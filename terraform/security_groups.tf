# ALB Security Group
resource "aws_security_group" "alb_sg" {
  name        = "expense-tracker-alb-sg"
  description = "Allow HTTP traffic for Expense Tracker"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ECS Security Group
resource "aws_security_group" "ecs_sg" {
  name        = "expense-tracker-ecs-sg"
  description = "Allow traffic to ECS services for Expense Tracker"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  ingress {
    from_port   = 5432 # PostgreSQL port
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # Local network
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EFS Security Group for Expense Tracker allowing NFS traffic on port 2049
resource "aws_security_group" "expense_tracker_efs_sg" {
  name        = "expense-tracker-efs-sg"
  description = "Allow inbound NFS traffic for EFS used by Expense Tracker"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # Adjust to your VPC CIDR range if necessary
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "expense-tracker-efs-sg"
  }
}
