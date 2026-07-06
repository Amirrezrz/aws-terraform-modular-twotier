module "network" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    public_subnet_cidrs = var.public_subnet_cidr
    private_subnet_cidrs = var.private_subnet_cidr
    my_ip = var.my_ip
}
module "Servers" {
    source = "./modules/compute"
    ami_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
     public_subnet_id = module.network.public_subnet_id
    private_subnet_id = module.network.private_subnet_id
    nginx_sg_id = module.network.nginx_sg_id
    mysql_sg_id = module.network.mysql_sg_id
}
