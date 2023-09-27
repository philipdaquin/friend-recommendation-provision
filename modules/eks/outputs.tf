

output "cluster_endpoint" {
    description = "Endpoint for EKS control plane"
    value = aws_eks_cluster.eks.endpoint
    
}
output "cluster_ca_certificate" {
    description = "Endpoint for EKS control plane"
    value = aws_eks_cluster.eks.certificate_authority[0].data
}
output "cluster_id" {
    value = aws_eks_cluster.eks.id
}
