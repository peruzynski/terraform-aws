resource "aws_autoscaling_group" "asg-web" {
  name                = var.asg-web-name
  desired_capacity    = 1
  max_size            = 2
  min_size            = 1
  target_group_arns   = [aws_lb_target_group.target-group-web.arn]
  health_check_type   = "EC2"
  vpc_zone_identifier = [aws_subnet.web-subnet1.id, aws_subnet.web-subnet2.id]


  launch_template {
    id      = aws_launch_template.template-web.id
    version = aws_launch_template.template-web.latest_version
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 90
      instance_warmup        = 300
    }
  }

# REMOVE SPOT INSTANCE CONFIGURATION TO ALLOW WARM-POOL
  # warm_pool {
  #   pool_state = "Stopped"
  #   min_size   = 1
  #   max_group_prepared_capacity = 2
  # }

  tag {
    key                 = "Name"
    value               = var.asg-web-name
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }

  tag {
    key                 = "Owner"
    value               = var.owner
    propagate_at_launch = true
  }

  tag {
    key                 = "Project"
    value               = var.project
    propagate_at_launch = true
  }
}