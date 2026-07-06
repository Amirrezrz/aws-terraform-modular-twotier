output "vpc_id" {
  value = aws_vpc.main.id
}
output "public_subnet_id" {
  value = aws_subnet.public.id
}
output "private_subnet_id" {
  value = aws_subnet.private.id
}
output "nginx_sg_id" {
  value = aws_security_group.nginx_sg.id
}
output "mysql_sg_id" {
  value = aws_security_group.mysql_sg.id
}
