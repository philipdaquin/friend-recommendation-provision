
# Local MiniKube


provider "helm" {
    kubernetes {
      config_path = "~/.kube/config"
    }
}


# provider "helm" {
#   kubernetes {
#     host                    = aws_eks_cluster.cluster.endpoint
#     cluster_ca_certificate  = base64decode(aws_eks_cluster.cluster.certificate_authority[0].data)
#     client_key              = aws_eks_cluster.cluster.client_key
    
#     exec {
#       api_version           = "client.authentication.k8s.io/v1beta1"
#       args                  = ["eks", "get-token", "--cluster-name", aws_eks_cluster.cluster.id]
#       command               = "aws"
#     }
#   }
# }
