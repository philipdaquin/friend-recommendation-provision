

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

## Architecture 





### Argo CD 



1. Provision infrastructure on Terraform 
2. Test connection with EchoServer. Expose application to NLB 
3. Install Argo CD and select the manifest files 
4. Initialise an API gateway
5. Create a custom DNS with Route53 