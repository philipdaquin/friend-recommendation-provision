# CI Pipeline

### Goals
- Automate setting up your CI pipeline
- Static Testing
- Functional Testing
- Non-Functional Testing

## To Reproduce the CI pipeline: 
1. Insert an EC2 Key Pair in the `/ci-service` file; update the path provided to Terraform inside the `0-locals.tf`
2. Run `terraform init`
3. Run `terraform plan`
4. Run `terraform apply`
5. To get the Jenkins password, ssh to your EC2 instance and enter the following `systemctl status jenkins` 

### Technology Stack
- EC2
- Jenkins
- Docker and Docker-Compose
- SonarQube 
- Terraform 
- Ansible 