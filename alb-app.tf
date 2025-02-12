resource "aws_lb" "alb-app" {
  name               = var.alb-app-name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-security-group-app.id]
  subnets            = [aws_subnet.app-subnet1.id, aws_subnet.app-subnet2.id]
  enable_deletion_protection = false
  idle_timeout               = 60
  drop_invalid_header_fields = true
  enable_cross_zone_load_balancing = true
  tags = {
    Name        = var.alb-app-name
    Environment = var.environment
    Owner       = var.owner
    Project     = var.project
  }
}