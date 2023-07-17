
output "kubeconfig" {
  value = module.eks-kubeconfig.kubeconfig
  sensitive = true
}

output "region-bucket" {
  value = aws_s3_bucket.beacon.region

}

output "bucket-name"{
    value = aws_s3_bucket.beacon.bucket
}

