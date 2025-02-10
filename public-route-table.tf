resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gw.id
  }

  # route {
  #   cidr_block = "10.0.0.0/16"
  #   gateway_id = aws_vpc.vpc.id
  # }

  tags = {
    Name        = var.public-rt-name
    Environment = var.environment
    Owner       = var.owner
    Project     = var.project
  }
}

resource "aws_route_table_association" "pub-rt-association-1" {
  subnet_id      = aws_subnet.web-subnet1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "pub-rt-association-2" {
  subnet_id      = aws_subnet.web-subnet2.id
  route_table_id = aws_route_table.public-route-table.id
}