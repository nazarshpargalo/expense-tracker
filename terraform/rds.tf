# Create an RDS PostgreSQL instance for Expense Tracker
resource "aws_db_instance" "expense_tracker_rds" {
  allocated_storage      = 20
  max_allocated_storage  = 100
  engine                 = "postgres"
  engine_version         = "14.9"
  instance_class         = "db.t3.micro" # Adjust instance class as per your requirements
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet.id

  multi_az                = false
  publicly_accessible     = false
  storage_encrypted       = true
  backup_retention_period = 7 # Retain backups for 7 days
  skip_final_snapshot     = true
}

# Create a DB subnet group for RDS in your private subnets
resource "aws_db_subnet_group" "rds_subnet" {
  name       = "expense-tracker-rds-subnet-group"
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = "expense-tracker-rds-subnet-group"
  }
}
