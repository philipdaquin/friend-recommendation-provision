resource "aws_security_group" "ec2" {
  name   = "ubuntu_access"
  description = "Allow SSH inbound traffic"
  vpc_id = aws_vpc.main.id


  ingress {
    // Allow SSH
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  } 

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Node Exporter Access"
    from_port   = 9100
    to_port     = 9100
    protocol    = "TCP"
    cidr_blocks = [aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}