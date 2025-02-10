resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc-cidr-block
  # enable_dns_support   = true
  # enable_dns_hostnames = true
  # instance_tenancy     = "default"

  tags = {
    Name        = var.vpc-name
    Environment = var.environment
    Owner       = var.owner
    Project     = var.project
  }
}