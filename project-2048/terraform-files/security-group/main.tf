resource "aws_security_group" "eks_ec2" {
  vpc_id = var.vpc_id

  // Allow inbound traffic from EC2 to EKS cluster
  ingress {
    from_port   = 443  # Kubernetes API server port
    to_port     = 443
    protocol    = "tcp"
    security_groups = [var.eks_security_group_id]
    description = "Allow traffic from EC2 instances to EKS cluster"
  }

  // Allow outbound traffic from EC2 instances
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "eks-ec2-sg"
  }
}

output "security_group_id" {
  value = aws_security_group.eks_ec2.id
}
