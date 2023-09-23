
resource "aws_instance" "ec2" {
    
    #
    #   AMI for US-East-2 
    #   Version: 20.04 LTS
    #
    ami = "ami-0b6968e5c7117349a"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.private_zone1.id
    availability_zone = local.zone1
    security_groups = [aws_security_group.ec2.name]

    tags = {
        Name = "${local.env}-ec2"
    }

}