resource "aws_lb_target_group" "alb_target_group" {
  name     = "target-group-alb-terraform"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled = true
    path = "/health"
    protocol = "HTTP"
    matcher = "200-299"
    interval = 30
    timeout = 5
    healthy_threshold = 3
    unhealthy_threshold = 3
  }
}
