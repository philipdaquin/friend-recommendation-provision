
resource "helm_release" "argocd" {
    repository          = "https://argoproj.github.io/argo-helm"
    chart               = "argo-cd"
    name                = "argocd"
    namespace           = "argocd"
    version             = "3.35.4"
    create_namespace    = true
    values = [ file("values/argocd.yaml") ]
}