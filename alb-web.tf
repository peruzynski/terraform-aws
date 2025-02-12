resource "aws_lb" "alb-web" {
  name               = var.alb-web-name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-security-group-web.id]
  subnets            = [aws_subnet.web-subnet1.id, aws_subnet.web-subnet2.id]
  enable_deletion_protection = false
  idle_timeout               = 60
  drop_invalid_header_fields = true
  enable_cross_zone_load_balancing = true
  tags = {
    Name        = var.alb-web-name
    Environment = var.environment
    Owner       = var.owner
    Project     = var.project
  }
}