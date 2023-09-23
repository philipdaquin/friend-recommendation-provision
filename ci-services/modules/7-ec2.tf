
data "aws_ami" "linux" {
    most_recent = true
    owners = ["amazon"]
    filter {
        name = ""
        values = ["amzn-ami-hvm-*-x86_64-gp2"]
    }
}


module "ec2_public" {
    source = "terraform-aws-modules/ec2-instance/aws"
    version = "5.5.0"
    name = "dev-host"
    instance_type = "t2.micro"
    availability_zone = local.zone1
    subnet_id = aws_subnet.private_zone1
    associate_public_ip_address = true
    # vpc_security_group_ids = [aws_se]
    tags = {
        Name = "${local.env}-public"
    }
}