terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }
}
 provider "aws" {
    region = var.region
    profile = var.profile
 }

module "vpc_module" {
  source = "../services/network/vpc"
  vpc_cidrblock = var.vpccidr
}
module "subnet_module" {
  source = "../services/network/subnet"
  vpc_id = module.vpc_module.vpc_id
  cidr_block = var.subnet_cidrblock
}

module "internetgateway_module" {
  source = "../services/network/gateway"
  ig_cidrblock = "0.0.0.0/0"
  vpc_id = module.vpc_module.vpc_id
  subnet_id = module.subnet_module.subnet_id
}
module "gopi_instance_module" {
  source = "../services/compute/ec2"
  vpc_id = module.vpc_module.vpc_id
  subnet_id = module.subnet_module.subnet_id
  instance_type = var.instance_type
  ami = var.ami
  key_name = var.key_name
  public_key = var.public_key
}