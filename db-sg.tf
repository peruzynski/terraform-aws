resource "aws_security_group" "db-sg" {
  name        = var.db-sg-name
  description = "DB Security Group"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "MySQL access from ASG"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.asg-security-group-app.id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = var.db-sg-name
    Environment = var.environment
    Owner       = var.owner
    Project     = var.project
  }
}