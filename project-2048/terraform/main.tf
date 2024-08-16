provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

module "vpc" {
  source = "./vpc"
}

module "eks" {
  source          = "./eks"
  vpc_id           = module.vpc.vpc_id
  public_subnets   = module.vpc.public_subnets
  private_subnets  = module.vpc.private_subnets
}

module "securitygroup" {
  source              = "./securitygroup"
  vpc_id              = module.vpc.vpc_id
  eks_security_group_id = module.eks.eks_security_group_id
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}

output "security_group_id" {
  value = module.securitygroup.security_group_id
}
