variable "region" {
  description = "AWS region used for the OpsLedger EKS environment."
  type        = string
  default     = "ap-southeast-3"
}

variable "clusterName" {
  description = "Name of the EKS cluster used by OpsLedger."
  type        = string
  default     = "opsledger-eks"
}

variable "vpcName" {
  description = "Name of the VPC used by OpsLedger."
  type        = string
  default     = "opsledger-vpc"
}

variable "ecrRepositoryName" {
  description = "Name of the ECR repository used for the OpsLedger web image."
  type        = string
  default     = "opsledger-web"
}
