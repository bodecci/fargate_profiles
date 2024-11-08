# Specify the AWS provider and the region for the deployment
provider "aws" {
  region = var.region
}

# Create an EKS cluster with the specified name and IAM role
resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn

  # Configure the VPC for the EKS cluster using the provided subnet IDs
  vpc_config {
    subnet_ids = var.subnet_ids
  }

  # Ensure the EKS cluster is created after the IAM role is attached
  depends_on = [aws_iam_role_policy_attachment.eks_cluster_policy]
}

# Create a Fargate profile to run Kubernetes pods on AWS Fargate
resource "aws_eks_fargate_profile" "fargate_profile" {
  cluster_name          = aws_eks_cluster.eks_cluster.name
  fargate_profile_name  = "${var.cluster_name}-fargate-profile"

  # Set the IAM role used for executing Fargate pods
  pod_execution_role_arn = aws_iam_role.eks_fargate_pod_execution_role.arn

  # Specify the subnets for Fargate tasks
  subnet_ids = var.subnet_ids

  # Define the namespace selector for the Fargate profile
  selector {
    namespace = var.fargate_namespace
  }

  # Ensure the Fargate profile is created after the EKS cluster is available
  depends_on = [aws_eks_cluster.eks_cluster]
}
