module "eks"{
    source = "terraform-aws-modules/eks/aws"
    version = "~> 19.0"
    cluster_name = local.cluster_name
    cluster_version = "1.27"
    subnet_ids = module.vpc.public_subnets
    cluster_endpoint_public_access  = true
      cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

    
    tags = {
        Name = "EKS-Cluster"
    }
    
    vpc_id = module.vpc.vpc_id

    eks_managed_node_group_defaults = {
        instance_types = ["t3.micro"]
      }

    eks_managed_node_groups = {
      one = {
        name = "Worker-Group-1"
        min_size     = 2
        max_size     = 2
        desired_size = 2

        instance_types = ["t3.micro"]
      }
  }

}


module "eks-kubeconfig" {
  source  = "hyperbadger/eks-kubeconfig/aws"
  version = "2.0.0"
  depends_on = [module.eks]
  cluster_name = module.eks.cluster_name
}


