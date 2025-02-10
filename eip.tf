resource "aws_eip" "eip" {
  domain = "vpc"
  tags = {
    Environment = var.environment
    Owner       = var.owner
    Project     = var.project
  }
}