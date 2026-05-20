resource "aws_lb" "alb" {
  name               = "alb-terraform"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnet_ids

  enable_deletion_protection = true # Production environment, let "false" options

  tags = {
    Environment = "production"
  }
}

