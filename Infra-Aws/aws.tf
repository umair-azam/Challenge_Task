# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 4.16"
#     }
#   }

#   required_version = ">= 1.2.0"
# }


/******************************************
	VPC configuration
 *****************************************/

module "VPC" {
  source = "./VPC/"

  aws_region          = var.aws_region
  public_subnets_cidr = var.public_subnets_cidr
  #project_id   = var.project
  #network_name = var.network

}

