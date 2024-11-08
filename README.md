### Fargate Profile

##### setup AWS Fargate generic profile for use with Karpenter.
##### variables.tf: Make sure to provide the required variables such as vpc_id and subnet_ids when you run terraform apply or define them in a terraform.tfvars file.
##### Dependencies: The depends_on attribute ensures resources are created in the correct order.
##### iam.tf: Manages the IAM roles and policies required for the EKS cluster and Fargate pods to interact with other AWS resources.
##### outputs.tf: Provides the EKS cluster name and Fargate profile name as outputs for easy reference.