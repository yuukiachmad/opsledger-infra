terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.47"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.2"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23.0"
    }
  }

  backend "s3" {
    bucket = "opsledger-terraform-state"
    key    = "opsledger/terraform.tfstate"
    region = "ap-southeast-3"
  }

  required_version = ">= 1.6.3, < 2.0.0"
}
#