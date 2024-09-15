resource "aws_cloudwatch_log_group" "expense_tracker_log_group" {
  name              = "/ecs/expense-tracker-prod"
  retention_in_days = 7 # Adjust retention as per your needs
}
