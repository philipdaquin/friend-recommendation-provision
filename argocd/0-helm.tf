
# Local MiniKube
provider "helm" {
    kubernetes {
      config_path = "~/.kube/config"
    }
}


# provider "helm" {
#   kubernetes {
#     host                    = var.cluster_host
#     cluster_ca_certificate  = base64decode(var.cluster_ca_certificate)
#     exec {
#       api_version           = "client.authentication.k8s.io/v1beta1"
#       args                  = ["eks", "get-token", "--cluster-name", var.cluster_id]
#       command               = "aws"
#     }
#   }
# }
