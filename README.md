

# Friend Recommendation Infrastructure Provisioning [POC]
**Note: Currently works in the US-East Region. There seems to be an issue when initialising in Sydney Region.

This project provisions a Kubernetes Cluster (EKS) to manage each microservices.  It uses a GitOps workflow to simplfy the process of Continous Deployments to AWS.

This project shows you the entire CI CD pipeline for the app 
it will create all the infrastructe required to run the ci cd piepline adn as well support 


### Prerequisites:
- Terraform 
- Kubernetes 
- Argo CD

### AWS Stack 
- EKS
- VPC
- IAM 
- EC2
- Autoscaling 
- Gateway 

## Architecture **[POC]**
![aws_architecture](https://github.com/philipdaquin/friend-recommendation-provision/assets/85416532/e1ec189e-6631-4d93-b099-41378943201e)



### Argo CD 
**Manual Installation**: https://argo-cd.readthedocs.io/en/stable/getting_started/
or initialise Argo CD using Helm with Terraform. /argocd

[description]



### Steps to reproduce
1. Provision infrastructure on Terraform 
2. Test connection with EchoServer. Expose application to NLB 
3. Install Argo CD and select the manifest files 
4. Initialise an API gateway
5. Create a hosted zone in Route53. 
6. Create custom DNS name with ACM certificate. 
