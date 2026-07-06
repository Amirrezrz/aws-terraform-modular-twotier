variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}
variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}
#default: ubuntu 24.04
variable "ami_id" {
  description = "The AMI ID for the EC2 instances"
  type        = string 
  default     = "ami-0b6d9d3d33ba97d99"
}
#default server type would be t3.micro because it is free tier eligible and is more accessible in most regions
variable "instance_type" {
  description = "The instance type for the EC2 instances"
  type        = string
  default     = "t3.micro"
}
variable "key_name" {
  description = "The name of the key pair to use for the EC2 instances"
  type        = string
}
variable "my_ip" {
  description = "The IP address of the machine from which you are running Terraform"
  type        = string
}

