# Define an EFS file system for Expense Tracker PostgreSQL
resource "aws_efs_file_system" "expense_tracker_fs" {
  lifecycle_policy {
    transition_to_ia = "AFTER_7_DAYS" # Optional, saves cost by moving infrequently accessed files to IA storage
  }

  encrypted = true # Enables encryption at rest

  tags = {
    Name = "expense-tracker-efs"
  }
}

# Create a mount target for the EFS in your VPC for Expense Tracker
resource "aws_efs_mount_target" "expense_tracker_mount_target" {
  for_each = {
    "subnet-1" = module.vpc.public_subnets[0]
    "subnet-2" = module.vpc.public_subnets[1]
  }

  file_system_id  = aws_efs_file_system.expense_tracker_fs.id
  subnet_id       = each.value
  security_groups = [aws_security_group.expense_tracker_efs_sg.id]
}
