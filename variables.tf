variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "my-eks-cluster"
}

variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}

variable "fargate_namespace" {
  default = "default"
}
