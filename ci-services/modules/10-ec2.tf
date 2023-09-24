
resource "aws_instance" "ec2" {
    #
    #   AMI for US-East-2 
    #   Version: 20.04 LTS
    #   ami-03605c16ec8bff7de
    #
    # ami                             = data.aws_ami.amzlinux.id
    ami                             = "ami-03605c16ec8bff7de"
    instance_type                   = local.instance_type
    associate_public_ip_address     = true
    subnet_id                       = aws_subnet.public_zone1.id
    # availability_zone               = local.zone1
    security_groups                 = [aws_security_group.ec2.id]
    key_name                        = local.ssh_user
    
    tags = {
        Name = "${local.env}-ec2"
    }

    #   
    #   Running Without initialising Ansible
    #
    # provisioner "remote-exec" {
    #     inline = [ "echo 'Wait Until SSH is ready" ]
    #     connection {
    #         type = "ssh"
    #         user = local.ssh_user
    #         private_key = file(local.private_key_path)
    #         host = aws_instance.ec2.public_ip
    #     }
    # }
    # provisioner "local-exec" {
    #     command = "ansible-playbook -i ${aws_instance.ec2.public_ip}, --private-key ${local.private_key_path} ../playbooks/docker.yaml" 
    # }
    # provisioner "local-exec" {
    #     command = "ansible-playbook -i ${aws_instance.ec2.public_ip}, --private-key ${local.private_key_path} ../playbooks/jenkins.yaml" 
    # }
    #
}

output "ec2" {
    value = aws_instance.ec2.public_ip
}