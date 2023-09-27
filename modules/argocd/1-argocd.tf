
resource "helm_release" "argocd" {
    repository          = "https://argoproj.github.io/argo-helm"
    chart               = "argo-cd"
    name                = "argocd"
    namespace           = "argocd"
    version             = "4.9.7"
    create_namespace    = true
    values = [ file("../modules/argocd/values/argocd.yaml") ]
}