# ECR Repository for Expense Tracker
resource "aws_ecr_repository" "expense_tracker_repo" {
  name         = "expense-tracker-app"
  force_delete = true
}
