


# Retrieve EKS cluster configuration


# data "aws_eks_cluster_auth" "cluster" {
#   name = data.terraform_remote_state.eks.outputs.cluster_name
# }


resource "helm_release" "argocd_updater" {
    repository          = "https://argoproj.github.io/argo-helm"
    chart               = "argo-cd-updater"
    name                = "argocd-updater"
    namespace           = "argocd-updater"
    version             = "4.9.7"
    create_namespace    = true
    values = [ file("values/argocd.yaml") ]
}