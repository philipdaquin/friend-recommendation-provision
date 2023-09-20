

variable "env" {
    description = "Environment Variable"
    type = string
}

variable "eks_name" {
    description = "value"
    type = string
    default = "new-eks-cluster"
}

variable "eks_version" {
    description = "value"
    type = string
}

variable "subnet_ids" {
    description = "value"
    type = list(string)
}

variable "node_groups" {
    description = "value"
    type = map(any)
}

variable "node_iam_policies" {
    description = "List of IAM Policies to attach to EKS-managed nodes"
    type = map(any)

    default = {
        1 = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
        2 = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
        3 = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
        4 = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    }
}

variable "enable_irsa" {
    description = "value"
    type = bool
    default = true
}