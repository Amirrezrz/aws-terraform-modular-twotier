variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}
variable "public_subnet_cidrs" {
  description = " CIDR blocks for the public subnets"
  type        = string
}
variable "private_subnet_cidrs" {
  description = "CIDR blocks for the private subnets"
  type        = string
}
variable "my_ip" {
  description = "Your local IP address for SSH access"
  type        = string
}
