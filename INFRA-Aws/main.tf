provider "aws" {
    region = var.region

}


terraform {
  backend "s3" {
    bucket =  "aws-s3-bucket-spacebeacon"
    key    = "terraform.tfstate"
    region = "eu-north-1"
  }
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

resource "aws_s3_bucket" "beacon" {
  bucket = "aws-s3-bucket-spacebeacon"
#   region = var.region
  tags = {
    Name        = "beacon"
    Environment = "Prod"
  }
}



locals {
    cluster_name = "EKS-Cluster"
}

locals {
  availability_zones = ["eu-north-1a","eu-north-1b"]
}