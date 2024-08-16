variable "vpc_id" {
  description = "The VPC ID to deploy the EKS cluster in"
}

variable "public_subnets" {
  description = "List of public subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet IDs for the EKS cluster"
  type        = list(string)
}
