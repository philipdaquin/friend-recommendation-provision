

module "eks" {
    source = "../modules/eks"
}

module "argocd" {
    source = "../modules/argocd"
    cluster_host = try(module.eks.cluster_endpoint)
    cluster_ca_certificate = try(module.eks.cluster_ca_certificate)
    cluster_id = try(module.eks.cluster_id)
}