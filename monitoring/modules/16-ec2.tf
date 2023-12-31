resource "aws_instance" "ec2" {
    ami = data.aws_ami.ubuntu.id

    instance_type = "t3a.small"
    key_name = "devops"
    subnet_id = aws_subnet.public_zone1.id
    vpc_security_group_ids = [aws_security_group.ec2.id]

    user_data = <<EOF
        #!/bin/bash

        sudo -s
        useradd --system --no-create-home --shell /bin/false node_exporter
        wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
        tar -xvf node_exporter-1.5.0.linux-amd64.tar.gz
        mv node_exporter-1.5.0.linux-amd64/node_exporter /usr/local/bin/

        cat <<EOT >> /etc/systemd/system/node_exporter.service
        [Unit]
        Description=Node Exporter
        Wants=network-online.target
        After=network-online.target
        StartLimitIntervalSec=500
        StartLimitBurst=5

        [Service]
        User=node_exporter
        Group=node_exporter
        Type=simple
        Restart=on-failure
        RestartSec=5s
        ExecStart=/usr/local/bin/node_exporter

        [Install]
        WantedBy=multi-user.target
        EOT

        systemctl enable node_exporter
        systemctl start node_exporter
    EOF


    /*
        Automate Installing Prometheus Operator Dependencies, CRDs, and deployment Yamls
    
    */
    # provisioner "remote-exec" {
    #     inline = [ "echo Installing Prometheus Operator, Wait for CRD to complete and Install all dependencies" ]

    #     connection {
    #         type = "ssh"
    #         user = "ubuntu"
    #         private_key = file(local.private_key_path)
    #         host = aws_instance.ec2.public_ip
    #     }
    # }

    # // Run ansible playbook
    # provisioner "local-exec" {
    #     command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ${local.ssh_user} -i ${aws_instance.ec2.public_ip}, --private-key ${local.private_key_path} ${local.playbook_path}" 
    # }
    tags = {
        Name          = "myapp"
        service       = "myapp"
        node-exporter = "true"
    }
}


output "success" {
        value = "Successfully installed monitoring services on EKS"
}
