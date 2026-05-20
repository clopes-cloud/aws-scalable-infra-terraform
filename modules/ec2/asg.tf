resource "aws_autoscaling_group" "asg_terraform" {
  name                      = "asg-terraform"
  max_size                  = 4 # Set only for testing
  min_size                  = 2
  desired_capacity          = 2

  health_check_grace_period = 300
  health_check_type         = "ELB"
  
  force_delete              = true

  vpc_zone_identifier = var.subnet_ids

  target_group_arns = [var.target_group_arn]

  launch_template {
    id = aws_launch_template.launch_template.id
    version = "$Default"
  }

  termination_policies = ["OldestInstance"]

  tag {
    key = "Name"
    value = "asg-terraform"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "cpu_target" {
  name = "asg-terraform-cpu-policy"
  autoscaling_group_name = aws_autoscaling_group.asg_terraform.name
  policy_type            = "TargetTrackingScaling"

  estimated_instance_warmup = 300

    target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 70.0

    disable_scale_in = false
  }
}