

output "cluster_endpoint" {
    description = "Endpoint for EKS control plane"
    value = aws_eks_cluster.eks.endpoint
}

