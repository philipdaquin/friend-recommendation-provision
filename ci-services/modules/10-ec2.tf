
resource "aws_instance" "ec2" {
    #
    #   AMI for US-East-2 
    #   Version: 20.04 LTS
    #   ami-03605c16ec8bff7de
    # ami                             = "ami-03605c16ec8bff7de"
    #
    ami                             = data.aws_ami.ubuntu.id
    instance_type                   = local.instance_type
    associate_public_ip_address     = true
    subnet_id                       = aws_subnet.public_zone1.id
    # availability_zone               = local.zone1
    security_groups                 = [aws_security_group.ec2.id]
    key_name                        = local.key_name
    
    tags = {
        Name = "${local.env}-ec2"
    }

    #   
    #   Running Without initialising Ansible
    # chmod 600 your_private_key_location
    provisioner "remote-exec" {
        
        inline = [ 
            # "sudo apt update", 
            "echo 😐 Wait Until SSH is ready" 
        ]
        
        connection {
            type = "ssh"
            user = local.ssh_user
            private_key = file(local.private_key_path)
            host = aws_instance.ec2.public_ip
        }
    }

    /*
        By setting the ANSIBLE_HOST_KEY_CHECKING environment variable to False, 
        you skip checking if the server was connected to beforehand.
    */
    provisioner "local-exec" {
        command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ${local.ssh_user} -i ${aws_instance.ec2.public_ip}, --private-key ${local.private_key_path} ${local.playbook_path}" 
    }
}

output "ec2" {
    value = aws_instance.ec2.public_ip
}

output "login" { 
    value = "To get the admin password, ssh -i devops.pem ubuntu@${aws_instance.ec2.public_ip}" 
}
output "getpassword" { 
    value = "Run `systemctl status jenkins`"
}