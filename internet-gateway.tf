resource "aws_internet_gateway" "internet-gw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = var.igw-name
    Environment = var.environment
    owner = var.owner
    project = var.project
  }
}