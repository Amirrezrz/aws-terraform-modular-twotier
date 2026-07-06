variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type = string
}
variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type = string
  default = "t3.micro"
}
variable "key_name" {
  description = "The name of the key pair to use for the EC2 instance"
  type = string
}
variable "public_subnet_id" {
  description = "The ID of the subnet to launch the EC2 instance in"
  type = string
}
variable "private_subnet_id" {
  description = "The ID of the private subnet to launch the EC2 instance in"
  type = string
}
variable "nginx_sg_id" {
  description = "The ID of the security group for the Nginx server"
  type = string
}
variable "mysql_sg_id" {
  description = "The ID of the security group for the MySQL server"
  type = string
}