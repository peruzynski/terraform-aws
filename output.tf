output "web-server-dns" {
  value = aws_lb.alb-web.dns_name
}

output "db-subnet-group-id" {
  value = aws_db_subnet_group.subnet-grp.id
}

output "nat-gateway-id" {
  value = aws_nat_gateway.nat-gw.id
}

output "asg-app-name" {
  value = aws_autoscaling_group.asg-app.name
}

output "eip-public-ip" {
  value = aws_eip.eip.public_ip
}