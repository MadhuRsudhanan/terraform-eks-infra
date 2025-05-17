provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  name   = "${var.cluster_name}-vpc"
  region = var.region
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = var.cluster_name
  region          = var.region
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnet_ids
  public_subnets  = module.vpc.public_subnet_ids
}