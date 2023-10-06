resource "aws_eks_addon" "driver" {
    cluster_name      = aws_eks_cluster.eks.name
    addon_name        = "aws-ebs-csi-driver"
    addon_version     = "v1.18.0-eksbuild.1"
    service_account_role_arn = aws_iam_role.eks_ebs_csi_driver.arn
}