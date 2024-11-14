# main.tf
provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
  
  vpc_cidr_block         = var.vpc_cidr_block
  public_subnet_1_cidr   = var.public_subnet_1_cidr
  public_subnet_2_cidr   = var.public_subnet_2_cidr
  az_1                    = var.az_1
  az_2                    = var.az_2
}

module "security_group" {
  source = "./modules/security_group"

  my_ip = var.my_ip
}

module "ec2_instance" {
  source = "./modules/ec2_instance"

  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = module.vpc.public_subnet_1.id
  security_group_id  = module.security_group.security_group_id
  ssh_public_key     = var.ssh_public_key
}

output "ec2_public_ip" {
  value = module.ec2_instance.ec2_public_ip
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}
