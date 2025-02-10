resource "aws_lb_target_group" "target-group-web" {
  name     = var.tg-web-name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  health_check {
    path                = "/"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = {
    Name        = var.tg-web-name
    Environment = var.environment
    Owner       = var.owner
    Project     = var.project
  }
}

resource "aws_lb_listener" "alb_listener-web" {
  load_balancer_arn = aws_lb.alb-web.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group-web.arn
  }

  tags = {
    # Name        = var.alb-listener-web-name
    Environment = var.environment
    Owner       = var.owner
    Project     = var.project
  }
}