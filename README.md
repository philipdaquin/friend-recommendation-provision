# Friend Recommendation Infrastructure Provisioning [POC]
**Note: Currently works in the US-East Region. There seems to be an issue when initialising in Sydney Region.

This project provisions a Kubernetes Cluster (EKS) to manage each microservices.  It uses a GitOps workflow to simplfy the process of Continous Deployments to AWS.

This repo is for:
- Centralised Monitoring and Logging 
- Cloud infrastructure
- End to End CI and CD Pipeline




### Prerequisites:
- Terraform 
- Kubernetes 
- Argo CD
- Kustomise
- Helm 


### AWS Stack 
- EKS
- VPC
- IAM 
- EC2
- Autoscaling 
- Gateway 

## AWS Architecture **[POC]**
![aws_architecture](https://github.com/philipdaquin/friend-recommendation-provision/assets/85416532/e1ec189e-6631-4d93-b099-41378943201e)


## CI / CD Pipeline Architecture 


## Continuous Integration Pipeline
Stack 
- Ansible 
- Jenkins
- Terraform 
- EC2

### Steps to reproduce 
The following steps will automate the provisioning of all services required to run a Jenkins Continuous Integration (CI) Server.
1. Create a new key pair in AWS. Insert it inside `/ci-services`. Go the `modules/0-locals.tf` to configure the file path of `***.pem`.
2. You may need to perform `chmod 600 *****.pem` to unlock the secret. 
2. Run Terraform 
3. Rock and Roll!


## Continous Deployment Pipeline
### Argo CD 
**Manual Installation**: https://argo-cd.readthedocs.io/en/stable/getting_started/
or initialise Argo CD using Helm with Terraform. /argocd

[description]



to do:
- image updater needs to be tested[DONE] 
- nice to haves: use ansible to automate argocd-to-eks deployment to initialise the app 
- modularise each aws services 


### Steps to reproduce Main Architecture 
1. Provision infrastructure on Terraform 
2. Test connection with EchoServer. Expose application to NLB 
3. Install Argo CD and select the manifest files 
4. Initialise an API gateway
5. Create a hosted zone in Route53. 
6. Create custom DNS name with ACM certificate. 

### Steps to reproduce ArgoCD Updater
1. Create a secret key for ArgoCD
2. Initialise ArgoCd using Terraform, using `terraform init...plan..apply`
3. Configure the target url to your Kubernetes Manifest files

### Create a secret key for ArgoCD
```
    kubectl --namespace argocd create secret generic argogitsecrets \
    --from-literal=username=[GITHUB_USERNAME] \             
    --from-literal=password=[GITHUB_TOKEN]       
```