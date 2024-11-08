# Define the AWS region where the resources will be deployed
variable "region" {
  default = "us-east-1"
}

# Name of the EKS cluster to be created
variable "cluster_name" {
  default = "my-eks-cluster"
}

# ID of the VPC where the EKS cluster and Fargate profile will be created
variable "vpc_id" {}

# List of subnet IDs that the EKS cluster and Fargate profile will use
variable "subnet_ids" {
  type = list(string)
}

# Namespace for the Fargate profile; defaults to "default"
variable "fargate_namespace" {
  default = "default"
}
