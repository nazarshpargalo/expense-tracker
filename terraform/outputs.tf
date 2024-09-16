output "load_balancer_dns" {
  value = aws_lb.expense_tracker_lb.dns_name
}

output "repo_url" {
  value = aws_ecr_repository.expense_tracker_repo.repository_url
}
