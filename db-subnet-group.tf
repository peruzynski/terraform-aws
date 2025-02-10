resource "aws_db_subnet_group" "subnet-grp" {
  description = "DB Subnet Group"
  name       = var.db-subnet-grp-name
  subnet_ids = [aws_subnet.db-subnet1.id,aws_subnet.db-subnet2.id]

  tags = {
    Name = var.db-subnet-grp-name
    Environment = var.environment
    Owner = var.owner
    Project = var.project
  }
}