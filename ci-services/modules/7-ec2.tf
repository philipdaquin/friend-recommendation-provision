
resource "aws_instance" "ec2" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    availability_zone = local.zone1

    tags = {
        Name = "${local.env}-ec2"
    }

    security_groups = [aws_security_group.ec2.name]
}