module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.27"
  vpc_id           = var.vpc_id
  subnet_ids          = var.public_subnets  # Use private_subnets if required by your setup

  eks_managed_node_groups = {
    node_group = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_types = ["t3.medium"]
    }
  }

  tags = {
    Name = "my-eks-cluster"
  }
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

output "eks_security_group_id" {
  value = module.eks.cluster_security_group_id
}
