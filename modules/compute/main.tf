resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [
    var.nginx_sg_id,
  ]
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
            EOF
  tags = {
    Name = "web-server"
  }
}
resource "aws_instance" "db_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.private_subnet_id
  vpc_security_group_ids = [
    var.mysql_sg_id,
  ]
user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install mariadb-server -y
              sudo systemctl start mariadb
              sudo systemctl enable mariadb
              sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
              sudo systemctl restart mariadb
              EOF
  tags = {
    Name = "db-server"
  }
}
