resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}
resource "aws_subnet" "public" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.public_subnet_cidrs
    map_public_ip_on_launch = true
    tags = {
        Name = "public-subnet"
    }
}
resource "aws_subnet" "private" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.private_subnet_cidrs
    map_public_ip_on_launch = false
    tags = {
        Name = "private-subnet"
    }
}
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
    tags = {
        Name = "private-route-table"
    }
}
resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private_association" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
resource "aws_security_group" "nginx_sg" {
    name        = "nginx-sg"
    description = "Allow HTTP and SSH traffic"
    vpc_id      = aws_vpc.main.id
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [var.my_ip]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "nginx-sg"
    }
}
resource "aws_security_group" "mysql_sg" {
    name        = "mysql-sg"
    description = "Allow MySQL traffic"
    vpc_id      = aws_vpc.main.id
    ingress {
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        security_groups = [aws_security_group.nginx_sg.id]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "mysql-sg"
    }
}
