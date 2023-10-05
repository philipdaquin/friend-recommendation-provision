
data "aws_iam_policy_document" "grafana" {
    statement {
        actions = [ "sts::AssumeRoleWithWebIdentity" ]
        effect = "Allow"

        condition {
            test = "StringEquals"
            variable = "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}"
            values = [ "system:serviceaccount:monitoring:grafana" ]
        }
        principals {
            identifiers = [aws_iam_openid_connect_provider.eks.arn]
            type = "Federated"
        }
    }
}

resource "aws_iam_role" "grafana" {
    assume_role_policy = data.aws_iam_policy_document.grafana.json
    name = "grafana"
}

resource "aws_iam_role_policy_attachment" "grafana" {
    role = aws_iam_role.grafana.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonPrometheusQueryAccess"
}