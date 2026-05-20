resource "aws_launch_template" "launch_template" {
  name = "launch-template-terraform"
  image_id = var.ami_id
  instance_type = var.instance_type

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = 10
      volume_type = "gp3"
      delete_on_termination = true 
    }
  }

  # disable_api_stop        = true # Functions disabled while this project used for studies
  # disable_api_termination = true # Functions disabled while this project used for studies

  ebs_optimized = true

  instance_initiated_shutdown_behavior = "terminate"

 network_interfaces {
   security_groups = var.security_groups
   delete_on_termination = true
 }

 user_data = base64encode(var.user_data)
 
}
