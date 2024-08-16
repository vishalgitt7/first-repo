variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
}

variable "eks_security_group_id" {
  description = "The security group ID of the EKS cluster"
}
