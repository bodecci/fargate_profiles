# Output the name of the EKS cluster created
output "eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

# Output the name of the Fargate profile created
output "fargate_profile_name" {
  value = aws_eks_fargate_profile.fargate_profile_name
}
