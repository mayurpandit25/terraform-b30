module "vpc" {
    source = "./module/vpc"
    vpc_cidr = var.vpc_cidr
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    public_az = var.public_az
    private_az = var.private_az
}

module "ec2" {
    source = "./module/ec2"
    ami = var.ami 
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = module.vpc.public_subnet_id
    sg_id = module.vpc.sg_id
}

