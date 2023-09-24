resource "aws_iam_role" "jenkins_role" {
    name = "jenkins"
    
    assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}


# attached aws ec2 policy is attached

resource "aws_iam_role_policy_attachment" "ec2full_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  role       = aws_iam_role.jenkins_role.name
}


# attached aws ecr policy is attached

resource "aws_iam_role_policy_attachment" "ecr_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
  role       = aws_iam_role.jenkins_role.name
  
}

# attached aws vpc policy is attached

resource "aws_iam_role_policy_attachment" "vpc_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
  role       =  aws_iam_role.jenkins_role.name
  
  
  }

# attached aws iam policy is attached

resource "aws_iam_role_policy_attachment" "iam_policy" {
  policy_arn =  "arn:aws:iam::aws:policy/IAMFullAccess"
  role       =  aws_iam_role.jenkins_role.name
 
  
  }
  
resource "aws_iam_instance_profile" "jenkins_instance_profile" {
  name  = "jenkins_instance_profile"
  role = "${aws_iam_role.jenkins_role.name}"
}
  