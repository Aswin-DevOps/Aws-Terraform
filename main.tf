module "vpc" {
  source          = "./modules/vpc"
  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  environment     = var.environment
}

module "ec2" {
  source           = "./modules/ec2"
  ami              = var.ami
  instance_type    = var.instance_type
  public_subnets   = module.vpc.public_subnets
  private_subnets  = module.vpc.private_subnets
  vpc_id           = module.vpc.vpc_id
  key_name         = var.key_name
  environment      = var.environment
  sg_name          = var.sg_name
  instance_configs = var.instance_configs
  volume_size      = var.volume_size
  volume_type      = var.volume_type
}
