data "aws_ami" "latest_amazon_linux-app" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_launch_template" "template-app" {
  name          = var.launch-template-app-name
  image_id      = data.aws_ami.latest_amazon_linux-app.id
  instance_type = var.instance-type
  # key_name      = var.key-name

  network_interfaces {
    device_index    = 0
    security_groups = [aws_security_group.asg-security-group-app.id]
  }

  user_data = filebase64("user-data.sh")

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size          = 30
      volume_type          = "gp2"
      delete_on_termination = true
    }
  }

  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price = "0.05"
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = var.app-instance-name
      Environment = var.environment
      Owner       = var.owner
      Project     = var.project
    }
  }

  tag_specifications {
    resource_type = "volume"
    tags = {
      Name        = var.app-instance-name
      Environment = var.environment
      Owner       = var.owner
      Project     = var.project
    }
  }
}