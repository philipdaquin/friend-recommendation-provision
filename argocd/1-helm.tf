
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


resource "helm_release" "argocd" {
    repository          = "https://argoproj.github.io/argo-helm"
    chart               = "argo-cd"
    name                = "argocd"
    namespace           = "argocd"
    version             = "4.9.7"
    create_namespace    = true
    values = [ file("application.yaml") ]
}