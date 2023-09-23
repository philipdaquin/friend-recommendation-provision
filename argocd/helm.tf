
data "terraform_remote_state" "eks" {
    backend = "local"
    config = {
      path = "../module/terraform.tfstate"
    }
}

# Retrieve EKS cluster configuration
data "aws_eks_cluster" "cluster" {
  name = data.terraform_remote_state.eks.outputs.cluster_name
}

# data "aws_eks_cluster_auth" "cluster" {
#   name = data.terraform_remote_state.eks.outputs.cluster_name
# }

provider "helm" {
  kubernetes {
    host                   = data.eks.cluster.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.cluster.certificate_authority[0].data)
    client_key = aws_eks_cluster.cluster.client_key
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.cluster.id]
      command     = "aws"
    }
  }
}

resource "helm_release" "argocd" {
    repository          = "https://argoproj.github.io/argo-helm"
    chart               = "argo-cd"
    name                = "argocd"
    namespace           = "argocd"
    version             = "4.9.7"
    create_namespace    = true
    values = [ file("application.yaml") ]
}