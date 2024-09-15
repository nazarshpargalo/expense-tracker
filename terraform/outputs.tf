output "load_balancer_dns" {
  value = aws_lb.expense_tracker_lb.dns_name
}
