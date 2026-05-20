output "target_group_arn" {
    description = "Target Group ARN"
    value = aws_lb_target_group.alb_target_group.arn
}

output "listener" {
  description = "Listener"
  value = aws_lb_listener.alb_listener.arn
}